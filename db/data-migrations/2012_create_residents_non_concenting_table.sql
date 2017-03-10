create table source.p4_residents_nonconsenting
(
  id serial primary key,
  p4_program_id varchar not null,
  abfm_last_four varchar not null,
  graduation_year integer
);

