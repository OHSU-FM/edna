--
-- Name: meta_attribute_questions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE target.meta_attribute_questions (
    id serial primary key,
    meta_attribute_entity_entity_type text NOT NULL,
    category text,
    attribute_name text,
    description text,
    original_text text,
    data_type text,
    options_hash text,
    continuous boolean,
    optional boolean,
    visible boolean DEFAULT true
);


