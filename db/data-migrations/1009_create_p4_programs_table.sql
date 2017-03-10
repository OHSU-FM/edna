create table source.p4_programs
(
  id serial primary key,
  abfm_program_id varchar not null,
  p4_program_id varchar not null,
  program_name varchar,
  alias varchar
);

