create sequence source.seq_p4_residents_id_seq;

create table source.p4_residents
(
  id serial primary key,
  p4_program_id varchar,
  abfm_last_four varchar not null,
  abfm_last_four_old varchar,
  entry_year integer not null,
  graduation_year integer,
  error_codes varchar,
  notes varchar
);





