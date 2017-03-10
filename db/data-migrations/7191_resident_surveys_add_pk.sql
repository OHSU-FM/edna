/* Rename id columns to abfm_last_four and create id column */
BEGIN TRANSACTION;

    ALTER TABLE source.y1_resident_responses ADD COLUMN p4_resident_id integer DEFAULT NULL;
    ALTER TABLE source.y1_resident_responses ADD COLUMN id SERIAL;
    UPDATE source.y1_resident_responses SET id = nextval(pg_get_serial_sequence('source.y1_resident_responses','id'));
    ALTER TABLE source.y1_resident_responses ADD PRIMARY KEY (id);
    
    
    ALTER TABLE source.y2_resident_responses ADD COLUMN p4_resident_id integer DEFAULT NULL;
    ALTER TABLE source.y2_resident_responses ADD COLUMN id SERIAL;
    UPDATE source.y2_resident_responses SET id = nextval(pg_get_serial_sequence('source.y2_resident_responses','id'));
    ALTER TABLE source.y2_resident_responses ADD PRIMARY KEY (id);
    
    
    ALTER TABLE source.y3_resident_responses ADD COLUMN p4_resident_id integer DEFAULT NULL;
    ALTER TABLE source.y3_resident_responses ADD COLUMN id SERIAL;
    UPDATE source.y3_resident_responses SET id = nextval(pg_get_serial_sequence('source.y3_resident_responses','id'));
    ALTER TABLE source.y3_resident_responses ADD PRIMARY KEY (id);
    
    
    ALTER TABLE source.y4_resident_responses ADD COLUMN p4_resident_id integer DEFAULT NULL;
    ALTER TABLE source.y4_resident_responses ADD COLUMN id SERIAL;
    UPDATE source.y4_resident_responses SET id = nextval(pg_get_serial_sequence('source.y4_resident_responses','id'));
    ALTER TABLE source.y4_resident_responses ADD PRIMARY KEY (id);
    
    
    ALTER TABLE source.y5_resident_responses ADD COLUMN p4_resident_id integer DEFAULT NULL;
    ALTER TABLE source.y5_resident_responses ADD COLUMN id SERIAL;
    UPDATE source.y5_resident_responses SET id = nextval(pg_get_serial_sequence('source.y5_resident_responses','id'));
    ALTER TABLE source.y5_resident_responses ADD PRIMARY KEY (id);


COMMIT;
