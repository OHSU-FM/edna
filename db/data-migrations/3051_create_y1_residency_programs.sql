create table source.y1_residency_programs
(
  p4_program_id varchar not null,
  id bigint not null,
  numInterviewed bigint null,
  numFilledMatchUSAllo bigint null,
  numFilledMatchUSOsteo bigint null,
  numFilledMatchIntl bigint null,
  numFilledJulyUSAllo bigint null,
  numFilledJulyUSOsteo bigint null,
  numFilledJulyIntl bigint null,
  resLeave bigint null,
  resLeavePGY1 bigint null,
  resLeavePGY2 bigint null,
  resLeavePGY3 bigint null,
  resLeavePGY4 bigint null,
  pctAAFP bigint null,
  numQiPGY1Avail bigint null,
  numQiPGY1Res bigint null,
  numQiPGY2Avail bigint null,
  numQiPGY2Res bigint null,
  numQiPGY3Avail bigint null,
  numQiPGY3Res bigint null,
  numQiPGY4Avail bigint null,
  numQiPGY4Res bigint null,
  numRschPGY1Avail bigint null,
  numRschPGY1Res bigint null,
  numRschPGY2Avail bigint null,
  numRschPGY2Res bigint null,
  numRschPGY3Avail bigint null,
  numRschPGY3Res bigint null,
  numRschPGY4Avail bigint null,
  numRschPGY4Res bigint null,
  pctPeerReview numeric(11, 2) null,
  pctNonPeerReview numeric(11, 2) null,
  pctPresenting numeric(11, 2) null,
  revGrants numeric(11, 2) null,
  revCharity numeric(11, 2) null,
  revState numeric(11, 2) null,
  revMedicareDirect numeric(11, 2) null,
  revMedicareIndirect numeric(11, 2) null,
  revMedicareHMO numeric(11, 2) null,
  revMedicareDisproportionate numeric(11, 2) null,
  revMedicaidDirect numeric(11, 2) null,
  revMedicaidIndirect numeric(11, 2) null,
  revHospitalGME numeric(11, 2) null,
  revOther numeric(11, 2) null,
  revOtherTxt varchar,
  revTotal numeric(11, 2) null,
  expFacultyFTE numeric(11, 2) null,
  expFacultySalary numeric(11, 2) null,
  expStaffFTE numeric(11, 2) null,
  expStaffSalary numeric(11, 2) null,
  expBenefits numeric(11, 2) null,
  expContracts numeric(11, 2) null,
  expEquipment numeric(11, 2) null,
  expSupplies numeric(11, 2) null,
  expRent numeric(11, 2) null,
  expOtherResOp numeric(11, 2) null,
  expOtherResOpTxt varchar,
  expRecruitment numeric(11, 2) null,
  expHospitalGME numeric(11, 2) null,
  expMalpractice numeric(11, 2) null,
  expHospStepDown numeric(11, 2) null,
  expMedSchool numeric(11, 2) null,
  expDME numeric(11, 2) null,
  expDFM numeric(11, 2) null,
  expOther numeric(11, 2) null,
  expOtherTxt varchar,
  expTotal numeric(11, 2) null,
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

  primary key (p4_program_id),

  unique (ID)
);

comment on column source.y1_residency_programs.p4_program_id is
  'P4-Assigned Residency ID';
comment on column source.y1_residency_programs.ID is
  'ABFM program ID';
comment on column source.y1_residency_programs.numinterviewed is
  '1.01 # medical graduates interviewed last year';
comment on column source.y1_residency_programs.numfilledmatchusallo is
  '1.02 # US Allopathic graduates filled in match';
comment on column source.y1_residency_programs.numfilledmatchusosteo is
  '1.02 # US Osteopathic graduates filled in match';
comment on column source.y1_residency_programs.numfilledmatchintl is
  '1.02 # International graduates filled in match';
comment on column source.y1_residency_programs.numfilledjulyusallo is
  '1.02 # US Allopathic graduates filled by July 1';
comment on column source.y1_residency_programs.numfilledjulyusosteo is
  '1.02 # US Osteopathic graduates filled by July 1';
comment on column source.y1_residency_programs.numfilledjulyintl is
  '1.02 # International graduates filled by July 1';
comment on column source.y1_residency_programs.resleave is
  '1.03 Residents leave program last year';
comment on column source.y1_residency_programs.resleavepgy1 is
  '1.03 # residents leave from PGY 1';
comment on column source.y1_residency_programs.resleavepgy2 is
  '1.03 # residents leave from PGY 2';
comment on column source.y1_residency_programs.resleavepgy3 is
  '1.03 # residents leave from PGY 3';
comment on column source.y1_residency_programs.resleavepgy4 is
  '1.03 # residents leave from PGY 4';
comment on column source.y1_residency_programs.pctaafp is
  '1.04 % of residents members of AAFP';
comment on column source.y1_residency_programs.numqipgy1avail is
  '1.05 # QI projects available to PGY 1 residents';
comment on column source.y1_residency_programs.numqipgy1res is
  '1.05 # PGY 1 Residents working on QI projects';
comment on column source.y1_residency_programs.numqipgy2avail is
  '1.05 # QI projects available to PGY 2 residents';
comment on column source.y1_residency_programs.numqipgy2res is
  '1.05 # PGY 2 Residents working on QI projects';
comment on column source.y1_residency_programs.numqipgy3avail is
  '1.05 # QI projects available to PGY 3 residents';
comment on column source.y1_residency_programs.numqipgy3res is
  '1.05 # PGY 3 Residents working on QI projects';
comment on column source.y1_residency_programs.numqipgy4avail is
  '1.05 # QI projects available to PGY 4 residents';
comment on column source.y1_residency_programs.numqipgy4res is
  '1.05 # PGY 4 Residents working on QI projects';
comment on column source.y1_residency_programs.numrschpgy1avail is
  '1.05 # Research projects available to PGY 1 residents';
comment on column source.y1_residency_programs.numrschpgy1res is
  '1.05 # PGY 1 residents working on research projects';
comment on column source.y1_residency_programs.numrschpgy2avail is
  '1.05 # Research projects available to PGY 2 residents';
comment on column source.y1_residency_programs.numrschpgy2res is
  '1.05 # PGY 2 residents working on research projects';
comment on column source.y1_residency_programs.numrschpgy3avail is
  '1.05 # Research projects available to PGY 3 residents';
comment on column source.y1_residency_programs.numrschpgy3res is
  '1.05 # PGY 3 residents working on research projects';
comment on column source.y1_residency_programs.numrschpgy4avail is
  '1.05 # Research projects available to PGY 4 residents';
comment on column source.y1_residency_programs.numrschpgy4res is
  '1.05 # PGY 4 residents working on research projects';
comment on column source.y1_residency_programs.pctpeerreview is
  '1.06 % Core faculty with at least one peer-reviewed publication last year';
comment on column source.y1_residency_programs.pctnonpeerreview is
  '1.07 % Core faculty with at least one NON-peer-reviewed publication last year';
comment on column source.y1_residency_programs.pctpresenting is
  '1.08 % Core faculty presenting at meetings last year';
comment on column source.y1_residency_programs.revgrants is
  '2.01.1 Amount of revenue in grants program received in 2006/2007';
comment on column source.y1_residency_programs.revcharity is
  '2.01.2 Amount of revenue in charitable contributions program received in 2006/2007';
comment on column source.y1_residency_programs.revstate is
  '2.01.3 Amount of revenue in state funding program received in 2006/2007';
comment on column source.y1_residency_programs.revmedicaredirect is
  '2.01.4.a Amount of revenue in Medicare direct program received in 2006/2007';
comment on column source.y1_residency_programs.revmedicareindirect is
  '2.01.4.b Amount of revenue in Medicare indirect program received in 2006/2007';
comment on column source.y1_residency_programs.revmedicarehmo is
  '2.01.4.c Amount of revenue in Medicare HMO carve out return payments program received in 2006/2007';
comment on column source.y1_residency_programs.revmedicaredisproportionate is
  '2.01.4.d Amount of revenue in Medicare disproportionate share program received in 2006/2007';
comment on column source.y1_residency_programs.revmedicaiddirect is
  '2.01.5.a Amount of revenue in Medicaid direct program received in 2006/2007';
comment on column source.y1_residency_programs.revmedicaidindirect is
  '2.01.5.b Amount of revenue in Medicaid indirect program received in 2006/2007';
comment on column source.y1_residency_programs.revhospitalgme is
  '2.01.6 Amount of revenue in Hospital GME program received in 2006/2007';
comment on column source.y1_residency_programs.revother is
  '2.01.7.a Amount of revenue in Other program received in 2006/2007';
comment on column source.y1_residency_programs.revothertxt is
  '2.01.7.b Other revenue specified, text';
comment on column source.y1_residency_programs.revtotal is
  '2.01.8 Amount of revenue Total program received in 2006/2007';
comment on column source.y1_residency_programs.expfacultyfte is
  '2.02.1.a.1 Program expenses in 2006/2007: Residency operations Faculty FTE';
comment on column source.y1_residency_programs.expfacultysalary is
  '2.02.1.a.2 Program expenses in 2006/2007: Residency operations Faculty Salaries';
comment on column source.y1_residency_programs.expstafffte is
  '2.02.1.b.1 Program expenses in 2006/2007: Residency operations Staff FTE';
comment on column source.y1_residency_programs.expstaffsalary is
  '2.02.1.b.2 Program expenses in 2006/2007: Residency operations Staff Salaries';
comment on column source.y1_residency_programs.expbenefits is
  '2.02.1.c Program expenses in 2006/2007: Residency operations Benefits';
comment on column source.y1_residency_programs.expcontracts is
  '2.02.1.d Program expenses in 2006/2007: Residency operations Contracts';
comment on column source.y1_residency_programs.expequipment is
  '2.02.1.e Program expenses in 2006/2007: Residency operations Equipment';
comment on column source.y1_residency_programs.expsupplies is
  '2.02.1.f Program expenses in 2006/2007: Residency operations Supplies';
comment on column source.y1_residency_programs.exprent is
  '2.02.1.g Program expenses in 2006/2007: Residency operations Rent';
comment on column source.y1_residency_programs.expotherresop is
  '2.02.1.h.1 Program expenses in 2006/2007: Residency operations Other';
comment on column source.y1_residency_programs.expotherresoptxt is
  '2.02.1.h.2 Program expenses in 2006/2007: Residency operations Other, text';
comment on column source.y1_residency_programs.exprecruitment is
  '2.02.2 Program expenses in 2006/2007: Recruitment';
comment on column source.y1_residency_programs.exphospitalgme is
  '2.02.3 Program expenses in 2006/2007: Hospital GME';
comment on column source.y1_residency_programs.expmalpractice is
  '2.02.4 Program expenses in 2006/2007: Malpractice Costs';
comment on column source.y1_residency_programs.exphospstepdown is
  '2.02.5 Program expenses in 2006/2007: Hospital Step-down Costs';
comment on column source.y1_residency_programs.expmedschool is
  '2.02.6 Program expenses in 2006/2007: Medical School';
comment on column source.y1_residency_programs.expdme is
  '2.02.7 Program expenses in 2006/2007: DME Costs';
comment on column source.y1_residency_programs.expdfm is
  '2.02.8 Program expenses in 2006/2007: DFM Costs';
comment on column source.y1_residency_programs.expother is
  '2.02.9.1 Program expenses in 2006/2007: Other';
comment on column source.y1_residency_programs.expothertxt is
  '2.02.9.2 Program expenses in 2006/2007: Other, text';
comment on column source.y1_residency_programs.exptotal is
  '2.02.10 Program expenses in 2006/2007: Total Expenses';
comment on column source.y1_residency_programs.ratefacdevel is
  '3.01.a Rate faculty development';
comment on column source.y1_residency_programs.ratefacmorale is
  '3.01.b Rate faculty morale';
comment on column source.y1_residency_programs.rateresmorale is
  '3.01.c Rate resident morale';
comment on column source.y1_residency_programs.ratesatisfaction is
  '3.01.d Rate residency program satisfaction';
comment on column source.y1_residency_programs.facsalaryexp is
  '4.01.a Program Expenses in 2006/2007 - Faculty Salary';
comment on column source.y1_residency_programs.volfacultyexp is
  '4.01.b Program Expenses in 2006/2007 - Volunteer Faculty';
comment on column source.y1_residency_programs.clinstaffexp is
  '4.01.c Program Expenses in 2006/2007 - Clinical Staff';
comment on column source.y1_residency_programs.nonclinstaffexp is
  '4.01.d Program Expenses in 2006/2007 - Non-Clinical Staff';
comment on column source.y1_residency_programs.recruitexp is
  '4.01.e Program Expenses in 2006/2007 - Recruitment';
comment on column source.y1_residency_programs.contractexp is
  '4.01.f Program Expenses in 2006/2007 - Contracts';
comment on column source.y1_residency_programs.capitalexp is
  '4.01.g Program Expenses in 2006/2007 - Capital';
comment on column source.y1_residency_programs.billingisexp is
  '4.01.h Program Expenses in 2006/2007 - Billing and Information Systems';
comment on column source.y1_residency_programs.grantsrev is
  '4.02.a Program Revenue in 2006/2007 - Grants';
comment on column source.y1_residency_programs.charitablerev is
  '4.02.b Program Revenue in 2006/2007 - Charitable Contributions';
comment on column source.y1_residency_programs.ptcarerev is
  '4.02.c Program Revenue in 2006/2007 - Patient Care';
comment on column source.y1_residency_programs.techancrev is
  '4.02.d Program Revenue in 2006/2007 - Technical and Ancillary Fees';

