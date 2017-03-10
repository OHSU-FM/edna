create table target.meta_attribute_statistics
(
  meta_attribute_statistic_id bigint not null,
  subset_id varchar,
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
  max numeric,
  subset_count numeric,
  subset_n numeric,
  subset_n_percent numeric(5,2),
  subset_mean numeric,
  subset_stddev numeric,
  subset_min numeric,
  subset_max numeric,
  ci_lower numeric,
  ci_upper numeric,
  subset_ci_lower numeric,
  subset_ci_upper numeric,
  is_continuous boolean not null default false,

  primary key (meta_attribute_statistic_id)
);

create unique index ix_meta_attribute_statistics
  on target.meta_attribute_statistics (subset_id, entity_schema, entity_name, attribute_name);

create sequence target.seq_meta_attribute_statistics_serial;





