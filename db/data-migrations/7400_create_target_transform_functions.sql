
--
-- P4 Residency Survey - Reporting Database
-- Oregon Health & Science University, Department of Family Medicine
--
-- Converted using editor macros from:
--    Y1 Residency Program Variables Clean 12.12.08.xls
--    Y1 Residency Program Variables Codebook.xls
--    All Y1 Continuity Clinic Variables Clean 12.12.08.xls
--    Y1 Continuity Clinic Variables Codebook.xls
--    Y1 Resident Survey Clean 12.12.08.xls
--    Y1 Resident Survey Codebook.xls
--
-- Technical Contact:
--    David Brown, browndav@ohsu.edu (12/2008 - 05/2011)
--    William Hatt, hattb@ohsu.edu (09/2011 - Current)
--

begin transaction;

create type transform.entity_subset_statistics_type as
(
  entity_schema varchar,
  entity_name varchar,
  attribute_index bigint,
  attribute_name varchar,
  attribute_description varchar,
  attribute_data_type varchar,
  count numeric,
  n numeric,
  n_percent numeric(5, 2),
  mean numeric,
  stddev numeric,
  min numeric,
  max numeric,
  subset_count numeric,
  subset_n numeric,
  subset_n_percent numeric(5,2),
  subset_mean numeric,
  subset_stddev numeric,
  subset_min numeric,
  subset_max numeric
);



create or replace
  function transform.entity_subset_statistics(_schema varchar,
                                              _entity varchar,
                                              _where1 varchar,
                                              _where2 varchar)
returns setof transform.entity_subset_statistics_type as
$$
  select
    superset.entity_schema, superset.entity_name, superset.attribute_index,
    superset.attribute_name, superset.attribute_description,
    superset.attribute_data_type, superset.count, superset.n,
    superset.n_percent, superset.mean, superset.stddev, superset.min,
    superset.max, subset.count as subset_count, subset.n as subset_n,
    subset.n_percent as subset_n_percent, subset.mean as subset_mean,
    subset.stddev as subset_stddev, subset.min as subset_min,
    subset.max as subset_max
  from
    transform.entity_statistics($1, $2, $3) as superset
    inner join
      transform.entity_statistics($1, $2, $4) as subset
        on superset.entity_schema = subset.entity_schema
          and superset.entity_name = subset.entity_name
          and superset.attribute_name = subset.attribute_name
  order by
    superset.entity_schema, superset.entity_name, superset.attribute_index;
$$ language sql stable strict;





-- Transform schema:
--    Functions to populate tables in the target.* schema.

create or replace
  function transform.append_meta_attribute_statistics(_schema varchar,
                                                      _entity varchar,
                                                      _subset_attribute varchar,
                                                      _subset_id varchar)
returns boolean as
$$
begin
  -- raise NOTICE 'amas %, %, %: %',
  --   _schema, _entity, _subset_attribute, _subset_id;

  insert into
    target.meta_attribute_statistics
  select
    nextval('target.seq_meta_attribute_statistics_serial'),
    $4 as subset_id, s.*,
    transform.calculate_ci(
      s.mean, s.stddev, s.n, -1, 0.05 /* 95% */
    ) as ci_lower,
    transform.calculate_ci(
      s.mean, s.stddev, s.n, 1, 0.05 /* 95% */
    ) as ci_upper,
    transform.calculate_ci(
      s.subset_mean, s.subset_stddev, s.subset_n, -1, 0.05 /* 95% */
    ) as subset_ci_lower,
    transform.calculate_ci(
      s.subset_mean, s.subset_stddev, s.subset_n, 1, 0.05 /* 95% */
    ) as subset_ci_upper
  from
    transform.entity_subset_statistics(
      $1, $2, '', quote_ident($3) || ' = ' || quote_literal($4)
    ) as s;

  return true;
end
$$ language plpgsql volatile strict;



create or replace
  function transform.append_meta_attribute_values(_subset_attribute varchar,
                                                  _subset_id varchar)
returns boolean as
$$
  insert into
    target.meta_attribute_values
  select
    nextval('target.seq_meta_attribute_values_serial'),
    (select s.meta_attribute_statistic_id
      from target.meta_attribute_statistics s
      where s.subset_id = $2
        and s.entity_schema = v.entity_schema
        and s.entity_name = v.entity_name
        and s.attribute_name = v.attribute_name),
    $2 as subset_id, v.*,
    transform.aggregate(
      v.entity_schema, v.entity_name, v.attribute_name, 'count', '',
        (quote_ident(v.attribute_name) || ' = ' || quote_literal(v.value))
    ) as count,
    transform.aggregate(
      v.entity_schema, v.entity_name, v.attribute_name, 'count', '',
        (quote_ident(v.attribute_name) || ' = ' || quote_literal(v.value)
          || ' and ' || quote_ident($1) || ' = ' || quote_literal($2))
    ) as subset_count
  from
    source.meta_attribute_values v;
  select true;
$$ language sql volatile strict;


commit;
