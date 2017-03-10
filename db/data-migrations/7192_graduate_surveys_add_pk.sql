/* Rename id columns to abfm_last_four and create id column */
BEGIN TRANSACTION;

 ALTER TABLE source.y1_graduate_responses ADD COLUMN p4_resident_id integer DEFAULT NULL; 
/* Old abfm is in id field, REAL abfm is in id2 field */
/*ALTER TABLE source.y1_graduate_responses RENAME COLUMN id TO abfm_last_four_old;
ALTER TABLE source.y1_graduate_responses RENAME COLUMN id2 TO abfm_last_four;*/
ALTER TABLE source.y1_graduate_responses ADD COLUMN id SERIAL;
UPDATE source.y1_graduate_responses SET id = nextval(pg_get_serial_sequence('source.y1_graduate_responses','id'));
ALTER TABLE source.y1_graduate_responses ADD PRIMARY KEY (id);

ALTER TABLE source.y2_graduate_responses ADD COLUMN p4_resident_id integer DEFAULT NULL;
/*ALTER TABLE source.y2_graduate_responses RENAME COLUMN id TO abfm_last_four;*/
ALTER TABLE source.y2_graduate_responses ADD COLUMN id SERIAL;
UPDATE source.y2_graduate_responses SET id = nextval(pg_get_serial_sequence('source.y2_graduate_responses','id'));
ALTER TABLE source.y2_graduate_responses ADD PRIMARY KEY (id);

ALTER TABLE source.y3_graduate_responses ADD COLUMN p4_resident_id integer DEFAULT NULL;
/*ALTER TABLE source.y3_graduate_responses RENAME COLUMN id TO abfm_last_four; */
ALTER TABLE source.y3_graduate_responses ADD COLUMN id SERIAL;
UPDATE source.y3_graduate_responses SET id = nextval(pg_get_serial_sequence('source.y3_graduate_responses','id'));
ALTER TABLE source.y3_graduate_responses ADD PRIMARY KEY (id);

ALTER TABLE source.y4_graduate_responses ADD COLUMN p4_resident_id integer DEFAULT NULL;
/*ALTER TABLE source.y4_graduate_responses RENAME COLUMN id TO abfm_last_four;*/
ALTER TABLE source.y4_graduate_responses ADD COLUMN id SERIAL;
UPDATE source.y4_graduate_responses SET id = nextval(pg_get_serial_sequence('source.y4_graduate_responses','id'));
ALTER TABLE source.y4_graduate_responses ADD PRIMARY KEY (id);

ALTER TABLE source.y5_graduate_responses ADD COLUMN p4_resident_id integer DEFAULT NULL;
/*ALTER TABLE source.y5_graduate_responses RENAME COLUMN id TO abfm_last_four;*/
ALTER TABLE source.y5_graduate_responses ADD COLUMN id SERIAL;
UPDATE source.y5_graduate_responses SET id = nextval(pg_get_serial_sequence('source.y5_graduate_responses','id'));
ALTER TABLE source.y5_graduate_responses ADD PRIMARY KEY (id);

ALTER TABLE source.y6_graduate_responses ADD COLUMN p4_resident_id integer DEFAULT NULL;
/*ALTER TABLE source.y6_graduate_responses RENAME COLUMN id TO abfm_last_four;*/
ALTER TABLE source.y6_graduate_responses ADD COLUMN id SERIAL;
UPDATE source.y6_graduate_responses SET id = nextval(pg_get_serial_sequence('source.y6_graduate_responses','id'));
ALTER TABLE source.y6_graduate_responses ADD PRIMARY KEY (id);

ALTER TABLE source.y7_graduate_responses ADD COLUMN p4_resident_id integer DEFAULT NULL;
/*ALTER TABLE source.y7_graduate_responses RENAME COLUMN id TO abfm_last_four;*/
ALTER TABLE source.y7_graduate_responses ADD COLUMN id SERIAL;
UPDATE source.y7_graduate_responses SET id = nextval(pg_get_serial_sequence('source.y7_graduate_responses','id'));
ALTER TABLE source.y7_graduate_responses ADD PRIMARY KEY (id);

COMMIT;
