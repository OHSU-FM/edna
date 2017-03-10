create table source.y2_residency_programs
(
  abfmresidencyid varchar not null,
  p4_program_id varchar not null,
  resLeave bigint null,
  resLeavePGY1 bigint null,
  resLeavePGY2 bigint null,
  resLeavePGY3 bigint null,
  resLeavePGY4 bigint null,
  facLeave bigint null,
  progDir varchar null,
  siteEval varchar null,
  assocProgDir varchar null,
  resCoord varchar null,
  otherFacLeave1 bigint null,
  otherFacLeave1Txt varchar null,
  otherFacLeave2 bigint null,
  otherFacLeave2Txt varchar null,
  numQiPGY1Res bigint null,
  numQiPGY2Res bigint null,
  numQiPGY3Res bigint null,
  numQiPGY4Res bigint null,
  numRschPGY1Res bigint null,
  numRschPGY2Res bigint null,
  numRschPGY3Res bigint null,
  numRschPGY4Res bigint null,
  pctPeerReview numeric(11, 2) null,
  pctNonPeerReview numeric(11, 2) null,
  pctPresenting numeric(11, 2) null,
  rps bigint null,
  rateFacDevel bigint null,
  rateFacMorale bigint null,
  rateResMorale bigint null,
  rateSatisfaction bigint null,
  facSalaryExp numeric(11, 2) null,
  volFacultyExp numeric(11, 2) null,
  clinStaffExp numeric(11, 2) null,
  nonclinStaffExp numeric(11, 2) null,
  recruitExp numeric(11, 2) null,
  contractExp numeric(11, 2) null,
  capitalExp numeric(11, 2) null,
  billingISExp numeric(11, 2) null,
  grantsRev numeric(11, 2) null,
  charitableRev numeric(11, 2) null,
  ptCareRev numeric(11, 2) null,
  techAncRev numeric(11, 2) null,

  primary key (p4_program_id)
);


comment on column source.y2_residency_programs.ABFMResidencyID is
  'ABFM-Assigned Residency ID';
comment on column source.y2_residency_programs.p4_program_id is
  'P4-Assigned Residency ID';
comment on column source.y2_residency_programs.resleave is
  '1.01 Residents leave program last year';
comment on column source.y2_residency_programs.resleavepgy1 is
  '1.01a # residents leave from PGY 1';
comment on column source.y2_residency_programs.resleavepgy2 is
  '1.01b # residents leave from PGY 2';
comment on column source.y2_residency_programs.resleavepgy3 is
  '1.01c # residents leave from PGY 3';
comment on column source.y2_residency_programs.resleavepgy4 is
  '1.01d # residents leave from PGY 4';
comment on column source.y2_residency_programs.facleave is
  '1.02 Members of core P4 team leave or transition during 2007/08 academic year?';
comment on column source.y2_residency_programs.progdir is
  '1.02a Program director reason for leaving';
comment on column source.y2_residency_programs.siteeval is
  '1.02b P4 Site Evaluator reason for leaving';
comment on column source.y2_residency_programs.assocprogdir is
  '1.02c Assoc. Program Director reason for leaving';
comment on column source.y2_residency_programs.rescoord is
  '1.02d Residency Coordinator reason for leaving';
comment on column source.y2_residency_programs.otherfacleave1 is
  '1.02e Other team member';
comment on column source.y2_residency_programs.otherfacleave1txt is
  '1.02e.1 Other team member reason for leaving';
comment on column source.y2_residency_programs.otherfacleave2 is
  '1.02f Other team member';
comment on column source.y2_residency_programs.otherfacleave2txt is
  '1.02f.1 Other team member reason for leaving';
comment on column source.y2_residency_programs.numqipgy1res is
  '1.03a # PGY 1 Residents working on QI projects';
comment on column source.y2_residency_programs.numqipgy2res is
  '1.03b # PGY 2 Residents working on QI projects';
comment on column source.y2_residency_programs.numqipgy3res is
  '1.03c # PGY 3 Residents working on QI projects';
comment on column source.y2_residency_programs.numqipgy4res is
  '1.03d # PGY 4 Residents working on QI projects';
comment on column source.y2_residency_programs.numrschpgy1res is
  '1.03e # PGY 1 residents working on research projects';
comment on column source.y2_residency_programs.numrschpgy2res is
  '1.03f # PGY 2 residents working on research projects';
comment on column source.y2_residency_programs.numrschpgy3res is
  '1.03g # PGY 3 residents working on research projects';
comment on column source.y2_residency_programs.numrschpgy4res is
  '1.03h # PGY 4 residents working on research projects';
comment on column source.y2_residency_programs.pctpeerreview is
  '1.04 % Core faculty with at least one peer-reviewed publication during 2007/08';
comment on column source.y2_residency_programs.pctnonpeerreview is
  '1.05 % Core faculty with at least one NON-peer-reviewed publication during 2007/08';
comment on column source.y2_residency_programs.pctpresenting is
  '1.06 % Core faculty presenting at regional or national meetings during 2007/08';
comment on column source.y2_residency_programs.rps is
  '1.07 Did program receive RPS training during 2007/08?';
comment on column source.y2_residency_programs.ratefacdevel is
  '2.1a Rate faculty development';
comment on column source.y2_residency_programs.ratefacmorale is
  '2.1b Rate faculty morale';
comment on column source.y2_residency_programs.rateresmorale is
  '2.1c Rate resident morale';
comment on column source.y2_residency_programs.ratesatisfaction is
  '2.1d Rate residency program satisfaction';
comment on column source.y2_residency_programs.facsalaryexp is
  'Expense Faculty Salary';
comment on column source.y2_residency_programs.volfacultyexp is
  'Expense Volunteer Faculty';
comment on column source.y2_residency_programs.clinstaffexp is
  'Expense Clinical Staff';
comment on column source.y2_residency_programs.nonclinstaffexp is
  'Expense Non-Clinical Staff';
comment on column source.y2_residency_programs.recruitexp is
  'Expense Recruitment';
comment on column source.y2_residency_programs.contractexp is
  'Expense Contracted Services';
comment on column source.y2_residency_programs.capitalexp is
  'Expense Capital Equipment Costs';
comment on column source.y2_residency_programs.billingisexp is
  'Expense Billing/Information Systems';
comment on column source.y2_residency_programs.grantsrev is
  'Revenue Grants';
comment on column source.y2_residency_programs.charitablerev is
  'Revenue Charitable Contrubutions';
comment on column source.y2_residency_programs.ptcarerev is
  'Revenue Patient Care';
comment on column source.y2_residency_programs.techancrev is
  'Revenue Technical/Ancillary Fees';

