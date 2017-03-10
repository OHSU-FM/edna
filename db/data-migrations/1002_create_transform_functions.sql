-- P4 Residency Survey - Reporting Database
-- Oregon Health & Science University, Department of Family Medicine
--
-- Technical Contact:
--    David Brown, browndav@ohsu.edu (12/2008 - 05/2011)
--    William Hatt, hattb@ohsu.edu (09/2011 - Current)
--

-- drop schema if exists public cascade;
-- drop schema if exists target cascade;
-- drop schema if exists transform cascade;
-- drop schema if exists source cascade;

--create language plpgsql;


begin transaction;

-- Sample size functions:
--    These assist in determining the sample size for a specific
--    variable, based upon specific data coding rules (i.e. "magic
--    values") used locally in the department.

create or replace
  function transform.nullify(bigint) returns bigint as
$$
  select (
    case $1
      when 555 then null
      when 777 then null
      when 888 then null
      when 999 then null
      else $1
    end
  ) as rv;
$$ language sql immutable strict;


create or replace
  function transform.nullify(integer) returns integer as
$$
  select (
    case $1
      when 555 then null
      when 777 then null
      when 888 then null
      when 999 then null
      else $1
    end
  ) as rv;
$$ language sql immutable strict;


create or replace
  function transform.nullify(varchar) returns varchar as
$$
  select (
    case ltrim(rtrim($1))
      when '555' then null
      when '777' then null
      when '888' then null
      when '999' then null
      else $1
    end
  ) as rv;
$$ language sql immutable strict;



create or replace
  function transform.nullify(numeric) returns numeric as
$$
  select (
    case $1
      when 555.0 then null
      when 777.0 then null
      when 888.0 then null
      when 999.0 then null
      else $1
    end
  ) as rv;
$$ language sql immutable strict;



-- Dynamic SQL functions:
--

create or replace
  function transform.column_comment(_schema varchar,
                                    _entity varchar, _attribute varchar)
returns varchar as
$$
  select col_description(
    (
      select
        c.oid
      from
        pg_class c
          left join pg_namespace ns on c.relnamespace = ns.oid
      where
        ns.nspname = $1 and c.relname = $2
    ),
    (
      select
        c.ordinal_position
      from
        information_schema.columns c
      where
        c.table_schema = $1
        and c.table_name = $2 and c.column_name = $3
    )
  );
$$ language sql stable strict;



create or replace
  function transform.aggregate(_schema varchar, _entity varchar,
                               _attribute varchar, _function varchar,
                               _filter /* const */ varchar,
                               _where /* const */ varchar)
returns numeric as
$$
declare
  rv numeric;
begin
  -- RAISE NOTICE 'agg 1-% 2-% 3-% 4-% 5-% 6-%', _schema,_entity,_attribute,_function,_filter,_where;

  /* RAISE NOTICE 'agg_type 1-% 2-% 3-% 4-% 5-% 6-%',
    pg_typeof( _schema),
    pg_typeof(_entity),
    pg_typeof(_attribute),
    pg_typeof(_function),
    pg_typeof(_filter),
    pg_typeof(_where);
  */
  execute
    'select ' || quote_ident(_function) || '(' || (
      case _attribute
        when '*' then '*' else (
          case
            when (length(_filter) > 0) then
              (/* const */ _filter || '(' || quote_ident(_attribute) || ')')
            else
              quote_ident(_attribute)
          end
        )
      end
    ) || ') from ' || quote_ident(_schema) || '.' || quote_ident(_entity) || (
      case
        when (length(_where) > 0) then (' where ' || /* const */ _where)
        else ''
      end
    ) || ';'
  into rv;

  return rv;
end
$$ language plpgsql stable strict;



create or replace
  function transform.is_numeric_type(_data_type varchar)
returns boolean as
$$
  select
    ($1 = 'smallint' or $1 = 'int' or $1 = 'bigint'
      or $1 = 'real' or $1 = 'double precision' or $1 = 'numeric');
$$ language sql immutable strict;



create type transform.entity_statistics_type as
(
  entity_schema varchar,
  entity_name varchar,
  attribute_index bigint,
  attribute_name varchar,
  attribute_description varchar,
  attribute_data_type varchar,
  count numeric,
  n numeric,
  n_percent numeric(5,2),
  mean numeric,
  stddev numeric,
  min numeric,
  max numeric
);



create or replace
  function transform.entity_statistics(_schema varchar,
                                       _entity varchar, _where varchar)
returns setof transform.entity_statistics_type as
$$
  select
    $1 as entity_schema,
    $2 as entity_name,
    cast(ordinal_position as bigint) as attribute_index,
    column_name as attribute_name,
    transform.column_comment($1, $2, column_name) as attribute_description,
    data_type as attribute_data_type,
    transform.aggregate($1, $2, '*', 'count', '', $3) as count,
    transform.aggregate(
      $1, $2, column_name::TEXT, 'count', 'transform.nullify', $3 /*a*/
    ) as n,
    cast(
      (100.0 *
        transform.aggregate(
          $1, $2, column_name::TEXT, 'count', 'transform.nullify', $3 /*a1*/ 
        )
      )
      / transform.aggregate(
        $1, $2, '*', 'count', '', $3/*a*/ 
      ) as numeric(63, 2)
    ) as n_percent,
    (
      case
        when transform.is_numeric_type(data_type) then
          cast(
            transform.aggregate(
              $1, $2, column_name::TEXT, 'avg', 'transform.nullify', $3/*a2*/ 
            ) as numeric(63, 2)
          )
        else
          null
      end
    ) as mean,
    (
      case
        when transform.is_numeric_type(data_type) then
          cast(
            transform.aggregate(
              $1, $2, column_name::TEXT, 'stddev_samp', 'transform.nullify', $3 /*a3*/ 
            ) as numeric(63, 2)
          )
        else
          null
      end
    ) as stddev,
    (
      case
        when transform.is_numeric_type(data_type) then
          cast(
            transform.aggregate(
              $1, $2, column_name::TEXT, 'min', 'transform.nullify', $3 /*a4*/ 
            ) as numeric(63, 2)
          )
        else
          null
      end
    ) as min,
   (
      case
        when transform.is_numeric_type(data_type) then
          cast(
            transform.aggregate($1, $2, column_name::TEXT, 'max', 'transform.nullify', $3) /*a5*/ 
              as numeric(63, 2)
          )
        else
          null
      end
    ) as max
    from information_schema.columns
  where
    table_schema::TEXT = $1 and table_name::TEXT = $2;
$$ language sql stable strict;



create table transform.critical_values
(
  df integer not null check (df >= 1),
  t numeric not null,
  alpha numeric not null default 0.05,

  primary key (alpha, df)
);

--  Attribute Metadata - Values:
--    Stores possible ordinal/nominal values and value descriptions for
--    each attribute. Possible values are indexed by (schema,
--    entity, attribute, value).

create table source.meta_attribute_values
(
  entity_schema varchar,
  entity_name varchar,
  attribute_name varchar,
  value numeric,
  value_description varchar,

  primary key (entity_schema, entity_name, attribute_name, value)
);



create or replace
  function transform.calculate_ci(_mean numeric,
                                  _stddev numeric,
                                  _n numeric,
                                  _sign numeric,
                                  _alpha numeric)
returns numeric as
$$
begin
  return (
    _mean + (
      _sign * (
        select t from transform.critical_values
          where alpha = _alpha and df < _n order by df desc limit 1
      ) * (_stddev / sqrt(_n))
    )
  );
end
$$ language plpgsql volatile strict;




commit;
