create table source.p4_clinics
(
  id serial primary key,
  p4_program_id varchar not null,
  p4_clinic_id varchar not null,
  clinic_abbreviation varchar,
  constraint u_p4_clinic_id unique (p4_clinic_id)
);
