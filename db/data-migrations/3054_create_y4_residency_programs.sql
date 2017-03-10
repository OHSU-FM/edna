CREATE TABLE source.y4_residency_programs
(
  p4_program_id varchar not null,
  resleave bigint,
  resleavepgy1 bigint,
  resleavepgy2 bigint,
  resleavepgy3 bigint,
  resleavepgy4 bigint,
  facleave bigint,
  progdir_leave bigint,
  progdir text,
  siteeval_leave bigint,
  siteeval text,
  assocprogdir_leave bigint,
  assocprogdir text,
  rescoord_leave bigint,
  rescoord text,
  otherfacleave1_leave bigint,
  otherfacleave1 text,
  otherfacleave1txt text,
  otherfacleave2_leave bigint,
  otherfacleave2 text,
  otherfacleave2txt text,
  numqipgy1res bigint,
  numqipgy2res bigint,
  numqipgy3res bigint,
  numqipgy4res bigint,
  numrschpgy1res bigint,
  numrschpgy2res bigint,
  numrschpgy3res bigint,
  numrschpgy4res bigint,
  nopgy4 bigint,
  pctpeerreview numeric,
  pctnonpeerreview numeric,
  pctpresenting numeric,
  rps bigint,
  ratefacdevel bigint,
  ratefacmorale bigint,
  rateresmorale bigint,
  ratesatisfaction bigint,

  primary key (p4_program_id)
);


comment on column source.y4_residency_programs.p4_program_id is
  'P4-Assigned Residency ID';
comment on column source.y4_residency_programs.resleave is
  '1.01 Residents leave program last year';
comment on column source.y4_residency_programs.resleavepgy1 is
  '1.01a # residents leave from PGY 1';
comment on column source.y4_residency_programs.resleavepgy2 is
  '1.01b # residents leave from PGY 2';
comment on column source.y4_residency_programs.resleavepgy3 is
  '1.01c # residents leave from PGY 3';
comment on column source.y4_residency_programs.resleavepgy4 is
  '1.01d # residents leave from PGY 4';
comment on column source.y4_residency_programs.facleave is
  '1.02 Members of core P4 team leave or transition during 2009/10 academic year?';
comment on column source.y4_residency_programs.progdir is
  '1.02a Program director reason for leaving';
comment on column source.y4_residency_programs.siteeval is
  '1.02b P4 Site Evaluator reason for leaving';
comment on column source.y4_residency_programs.assocprogdir is
  '1.02c Assoc. Program Director reason for leaving';
comment on column source.y4_residency_programs.rescoord is
  '1.02d Residency Coordinator reason for leaving';
comment on column source.y4_residency_programs.otherfacleave1 is
  '1.02e Other team member';
comment on column source.y4_residency_programs.otherfacleave1txt is
  '1.02e.1 Other team member reason for leaving';
comment on column source.y4_residency_programs.otherfacleave2 is
  '1.02f Other team member';
comment on column source.y4_residency_programs.otherfacleave2txt is
  '1.02f.1 Other team member reason for leaving';
comment on column source.y4_residency_programs.progdir_leave is
  '1.02a Did a Program director leave?';
comment on column source.y4_residency_programs.siteeval_leave is
  '1.02b Did a P4 Site Evaluator leave?';
comment on column source.y4_residency_programs.assocprogdir_leave is
  '1.02c Did a Assoc. Program Director leave?';
comment on column source.y4_residency_programs.rescoord_leave is
  '1.02d Did a Residency Coordinator leave?';
comment on column source.y4_residency_programs.otherfacleave1_leave is
  '1.02e Did another team member leave (#1)?';
comment on column source.y4_residency_programs.otherfacleave2_leave is
  '1.02f Did another team member leave (#2)?';
comment on column source.y4_residency_programs.numqipgy1res is
  '1.03a # PGY 1 Residents working on QI projects';
comment on column source.y4_residency_programs.numqipgy2res is
  '1.03b # PGY 2 Residents working on QI projects';
comment on column source.y4_residency_programs.numqipgy3res is
  '1.03c # PGY 3 Residents working on QI projects';
comment on column source.y4_residency_programs.numqipgy4res is
  '1.03d # PGY 4 Residents working on QI projects';
comment on column source.y4_residency_programs.numrschpgy1res is
  '1.03e # PGY 1 residents working on research projects';
comment on column source.y4_residency_programs.numrschpgy2res is
  '1.03f # PGY 2 residents working on research projects';
comment on column source.y4_residency_programs.numrschpgy3res is
  '1.03g # PGY 3 residents working on research projects';
comment on column source.y4_residency_programs.numrschpgy4res is
  '1.03h # PGY 4 residents working on research projects';
comment on column source.y4_residency_programs.nopgy4 is
  '1.03i Program does not have a PGY 4';
comment on column source.y4_residency_programs.pctpeerreview is
  '1.04 % Core faculty with at least one peer-reviewed publication during 2009/10';
comment on column source.y4_residency_programs.pctnonpeerreview is
  '1.05 % Core faculty with at least one NON-peer-reviewed publication during 2009/10';
comment on column source.y4_residency_programs.pctpresenting is
  '1.06 % Core faculty presenting at regional or national meetings during 2009/10';
comment on column source.y4_residency_programs.rps is
  '1.07 Did program receive RPS training during 2009/10?';
comment on column source.y4_residency_programs.ratefacdevel is
  '2.1a Rate faculty development';
comment on column source.y4_residency_programs.ratefacmorale is
  '2.1b Rate faculty morale';
comment on column source.y4_residency_programs.rateresmorale is
  '2.1c Rate resident morale';
comment on column source.y4_residency_programs.ratesatisfaction is
  '2.1d Rate residency program satisfaction';

