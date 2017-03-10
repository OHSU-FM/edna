--
-- Name: meta_attribute_groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE target.meta_attribute_entity_groups (
    id serial primary key,
    group_name text NOT NULL,
    parent_table text NOT NULL
);

create unique index ix_meta_attribute_entity_groups
  on target.meta_attribute_entity_groups (group_name);

