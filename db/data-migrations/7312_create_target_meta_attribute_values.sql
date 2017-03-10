create table target.meta_attribute_values
(
  meta_attribute_value_id bigint not null,
  meta_attribute_statistic_id bigint,
  subset_id varchar,
  entity_schema varchar,
  entity_name varchar,
  attribute_name varchar,
  value numeric,
  value_description varchar,
  count numeric,
  subset_count numeric,

  primary key (meta_attribute_value_id)
);

create unique index ix_meta_attribute_values
  on target.meta_attribute_values (subset_id, entity_schema, entity_name, attribute_name, value);

create index ix_meta_attribute_statistic_id
  on target.meta_attribute_values (meta_attribute_statistic_id);

create sequence target.seq_meta_attribute_values_serial;

