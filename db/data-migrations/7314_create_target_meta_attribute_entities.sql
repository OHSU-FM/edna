--
-- Name: meta_attribute_entities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE target.meta_attribute_entities (
    id serial primary key,
    entity_type text NOT NULL,
    meta_attribute_entity_group_group_name text NOT NULL,
    edition integer,
    version integer,
    start_date date,
    stop_date date,
    visible boolean DEFAULT true,
    reference_year integer
);
create unique index ix_meta_attribute_entities
  on target.meta_attribute_entities (entity_type);


