CREATE TABLE source.y3_continuity_clinics
(
  p4_program_id varchar not null,
  settingid varchar null,
  id bigint not null,
  participant_id bigint,
  created_at varchar,
  updated_at varchar,
  pgy1 bigint,
  pgy2 bigint,
  pgy3 bigint,
  pgy4 bigint,
  nopgy4 bigint,
  ptassigned bigint,
  pgy1routine numeric,
  pgy2routine numeric,
  pgy3routine numeric,
  pgy4routine numeric,
  pgy1acute numeric,
  pgy2acute numeric,
  pgy3acute numeric,
  pgy4acute numeric,
  daysnewapptfac3 numeric,
  daysnewapptfac3_unknown bigint,
  daysnewapptres3 numeric,
  daysnewapptres3_unknown bigint,
  daysfuapptfac3 numeric,
  daysfuapptfac3_unknown bigint,
  daysfuapptres3 numeric,
  daysfuapptres3_unknown bigint,
  daysacuteapptfac3 numeric,
  daysacuteapptfac3_unknown bigint,
  daysacuteapptres3 numeric,
  daysacuteapptres3_unknown bigint,
  numexamrooms bigint,
  numptfac bigint,
  numptmid bigint,
  numptres bigint,
  ftefp numeric,
  ftefmres numeric,
  fteped numeric,
  ftepedres numeric,
  fteim numeric,
  fteimres numeric,
  fteob numeric,
  fteobres numeric,
  fteotherphys1_present bigint,
  fteotherphys1 numeric,
  fteotherphys1txt text,
  fteotherphys2_present bigint,
  fteotherphys2 numeric,
  fteotherphys2txt text,
  ftenp numeric,
  ftepa numeric,
  fternlpn numeric,
  ftema numeric,
  fteallied numeric,
  fteadmin numeric,
  ftepsych numeric,
  ftesocial numeric,
  ftediet numeric,
  ftepteduc numeric,
  ftepharm numeric,
  fteotherspec1_present bigint,
  fteotherspec1 numeric,
  fteotherspec1txt text,
  fteotherspec2_present bigint,
  fteotherspec2 numeric,
  fteotherspec2txt text,
  numnp bigint,
  numpa bigint,
  numrnlpn bigint,
  numma bigint,
  numallied bigint,
  numpsych bigint,
  numsocial bigint,
  numdiet bigint,
  numpteduc bigint,
  numotherspec_present numeric,
  numotherspec bigint,
  numotherspectxt text,
  integrated bigint,
  owner bigint,
  ownerother text,
  male numeric,
  female numeric,
  gendersource text,
  lt3 numeric,
  three numeric,
  eighteen numeric,
  twentyfive numeric,
  fortyfive numeric,
  sixtyfive numeric,
  seventyfive numeric,
  agesource text,
  hispanic numeric,
  nonhispanic numeric,
  ethnicitysource text,
  indian numeric,
  asian numeric,
  black numeric,
  hawaiian numeric,
  white numeric,
  otherrace_present bigint,
  otherrace numeric,
  otherracetxt text,
  racesource text,
  prepaid numeric,
  ffs numeric,
  medicare numeric,
  medicaid numeric,
  otherpay_present bigint,
  otherpay numeric,
  otherpaytxt text,
  uninsured numeric,
  paysource text,
  xrays bigint,
  statemr bigint,
  statpaperless bigint,
  statremote bigint,
  stattranscription bigint,
  statscheduling bigint,
  statbilling bigint,
  statorders bigint,
  stathospemr bigint,
  statptcommunication bigint,
  statprovcommunication bigint,
  statqa bigint,
  statdisregistry bigint,
  statprevregistry bigint,
  statresearch bigint,
  statopenaccess bigint,
  statexpandedhrs bigint,
  stattelephone bigint,
  statnetscheduling bigint,
  statsurvey bigint,
  statspace bigint,
  statparking bigint,
  stattransit bigint,
  statteams bigint,
  statpsych bigint,
  statcasemgt bigint,
  statpharm bigint,
  statgroup bigint,
  statptcentered bigint,
  emrimplemented bigint,
  emryears numeric,
  emrexplain text,
  emrptsafety bigint,
  emrptsafetytxt text,

  primary key (p4_program_id, SettingID),

  unique (SettingID),

  foreign key (p4_program_id)
    references source.y1_residency_programs (p4_program_id)
);


comment on column source.y3_continuity_clinics.p4_program_id is
  'Unique P4-Assigned Residency Program ID';
comment on column source.y3_continuity_clinics.SettingID is
  'Unique P4 - Assigned Continuity Clinic ID';
comment on column source.y3_continuity_clinics.id is
  'Opaque Response ID';
comment on column source.y3_continuity_clinics.participant_id is
  'Opaque Participant ID';
comment on column source.y3_continuity_clinics.created_at is
  'Response Creation Time';
comment on column source.y3_continuity_clinics.updated_at is
  'Response Completion Time';
comment on column source.y3_continuity_clinics.id is
  'Internal Response ID';
comment on column source.y3_continuity_clinics.participant_id is
  'Internal Participant ID';
comment on column source.y3_continuity_clinics.created_at is
  'Response Creation Date';
comment on column source.y3_continuity_clinics.updated_at is
  'Response Completion Date';
comment on column source.y3_continuity_clinics.pgy1 is
  '1.01.a Number of PGY 1 residents assigned to continuity patients in 2008/09';
comment on column source.y3_continuity_clinics.pgy2 is
  '1.01.b Number of PGY 2 residents assigned to continuity patients in 2008/09';
comment on column source.y3_continuity_clinics.pgy3 is
  '1.01.c Number of PGY 3 residents assigned to continuity patients in 2008/09';
comment on column source.y3_continuity_clinics.pgy4 is
  '1.01.d Number of PGY 4 residents assigned to continuity patients in 2008/09';
comment on column source.y3_continuity_clinics.nopgy4 is
  '1.02 Program does not have a PGY 4';
comment on column source.y3_continuity_clinics.ptassigned is
  '1.03 Are the patients in the clinic assigned to a personal physician?';
comment on column source.y3_continuity_clinics.pgy1routine is
  '1.04.a Please estimate the percent of routine visits for PGY1 last year';
comment on column source.y3_continuity_clinics.pgy2routine is
  '1.04.b Please estimate the percent of routine visits for PGY2 last year';
comment on column source.y3_continuity_clinics.pgy3routine is
  '1.04.c Please estimate the percent of routine visits for PGY3 last year';
comment on column source.y3_continuity_clinics.pgy4routine is
  '1.04.d Please estimate the percent of routine visits for PGY4 last year';
comment on column source.y3_continuity_clinics.pgy1acute is
  '1.04.e Please estimate the percent of acute visits for PGY1 last year';
comment on column source.y3_continuity_clinics.pgy2acute is
  '1.04.f Please estimate the percent of acute visits for PGY2 last year';
comment on column source.y3_continuity_clinics.pgy3acute is
  '1.04.g Please estimate the percent of acute visits for PGY3 last year';
comment on column source.y3_continuity_clinics.pgy4acute is
  '1.04.f Please estimate the percent of acute visits for PGY4 last year';
comment on column source.y3_continuity_clinics.daysnewapptfac3 is
  '1.05.b Number of days to new patient 3rd available appointment for faculty';
comment on column source.y3_continuity_clinics.daysfuapptfac3 is
  '1.05.d Number of days to follow up 3rd available appointment for faculty';
comment on column source.y3_continuity_clinics.daysacuteapptfac3 is
  '1.05.f Number of days to acute 3rd available appointment for faculty';
comment on column source.y3_continuity_clinics.daysnewapptres3 is
  '1.05.h Number of days to new patient 3rd available appointment for residents';
comment on column source.y3_continuity_clinics.daysfuapptres3 is
  '1.05.j Number of days to follow up 3rd available appointment for residents';
comment on column source.y3_continuity_clinics.daysacuteapptres3 is
  '1.05.l Number of days to acute 3rd available appointment for residents';
comment on column source.y3_continuity_clinics.daysnewapptfac3_unknown is
  '1.05.b Unknown number of days to new patient 3rd available appointment for faculty';
comment on column source.y3_continuity_clinics.daysfuapptfac3_unknown is
  '1.05.d Unknown number of days to follow up 3rd available appointment for faculty';
comment on column source.y3_continuity_clinics.daysacuteapptfac3_unknown is
  '1.05.f Unknown number of days to acute 3rd available appointment for faculty';
comment on column source.y3_continuity_clinics.daysnewapptres3_unknown is
  '1.05.h Unknown number of days to new patient 3rd available appointment for residents';
comment on column source.y3_continuity_clinics.daysfuapptres3_unknown is
  '1.05.j Unknown number of days to follow up 3rd available appointment for residents';
comment on column source.y3_continuity_clinics.daysacuteapptres3_unknown is
  '1.05.l Unknown number of days to acute 3rd available appointment for residents';
comment on column source.y3_continuity_clinics.numexamrooms is
  '1.06 Total number of exam rooms';
comment on column source.y3_continuity_clinics.numptfac is
  '1.07.a Total # of patients seen by faculty in 2008/09';
comment on column source.y3_continuity_clinics.numptmid is
  '1.07.b Total # of patients seen by Mid-level clinicians in 2008/09';
comment on column source.y3_continuity_clinics.numptres is
  '1.07.c Total # of patients seen by residents in 2008/09';
comment on column source.y3_continuity_clinics.ftefp is
  '1.08.a Number of physician FTEs for Family Physicians';
comment on column source.y3_continuity_clinics.ftefmres is
  '1.08.b Number of physician FTEs for Family Medicine Residents';
comment on column source.y3_continuity_clinics.fteped is
  '1.08.c Number of physician FTEs for Pediatricians';
comment on column source.y3_continuity_clinics.ftepedres is
  '1.08.d Number of physician FTEs for Pediatric Residents';
comment on column source.y3_continuity_clinics.fteim is
  '1.08.e Number of physician FTEs for Internists';
comment on column source.y3_continuity_clinics.fteimres is
  '1.08.f Number of physician FTEs for Internal Medicine Residents';
comment on column source.y3_continuity_clinics.fteob is
  '1.08.g Number of physician FTEs for OBGYN Physicians';
comment on column source.y3_continuity_clinics.fteobres is
  '1.08.h Number of physician FTEs for OBGYN Residents';
comment on column source.y3_continuity_clinics.fteotherphys1_present is
  '1.08.i Entry Present? - Physician for Other Specialty 1';
comment on column source.y3_continuity_clinics.fteotherphys1 is
  '1.08.i Number of physician FTEs for Other Specialty 1';
comment on column source.y3_continuity_clinics.fteotherphys1txt is
  '1.08.j Number of physician FTEs for Other Specialty 1 Text';
comment on column source.y3_continuity_clinics.fteotherphys2_present is
  '1.08.k Entry Present? - Physician for Other Specialty 2';
comment on column source.y3_continuity_clinics.fteotherphys2 is
  '1.08.k Number of physician FTEs for Other Specialty 2';
comment on column source.y3_continuity_clinics.fteotherphys2txt is
  '1.08.l Number of physician FTEs for Other Specialty 2 Text';
comment on column source.y3_continuity_clinics.ftenp is
  '1.09.a Number of clinical staff FTEs for Nurse Practioners';
comment on column source.y3_continuity_clinics.ftepa is
  '1.09.b Number of clinical staff FTEs for Physicians Assistants';
comment on column source.y3_continuity_clinics.fternlpn is
  '1.09.c Number of clinical staff FTEs for Nursing Staff RN/LPN';
comment on column source.y3_continuity_clinics.ftema is
  '1.09.d Number of clinical staff FTEs for Medical Assistants';
comment on column source.y3_continuity_clinics.fteallied is
  '1.09.e Number of clinical staff FTEs for Allied Health Staff';
comment on column source.y3_continuity_clinics.fteadmin is
  '1.09.f Number of clinical staff FTEs for Administrative Staff';
comment on column source.y3_continuity_clinics.ftepsych is
  '1.09.g Number of clinical staff FTEs for Psychologists';
comment on column source.y3_continuity_clinics.ftesocial is
  '1.09.h Number of clinical staff FTEs for Social Workers';
comment on column source.y3_continuity_clinics.ftediet is
  '1.09.i Number of clinical staff FTEs for Dieticians';
comment on column source.y3_continuity_clinics.ftepteduc is
  '1.09.j Number of clinical staff FTEs for Patient Educators';
comment on column source.y3_continuity_clinics.ftepharm is
  '1.09.k Number of clinical staff FTEs for Pharmacy';
comment on column source.y3_continuity_clinics.fteotherspec1_present is
  '1.09.l Entry Present? - FTE for Other Specialty 1';
comment on column source.y3_continuity_clinics.fteotherspec1 is
  '1.09.l Number of clinical staff FTEs for Other Specialty 1';
comment on column source.y3_continuity_clinics.fteotherspec1txt is
  '1.09.m Number of clinical staff FTEs for Other Specialty 1 Text';
comment on column source.y3_continuity_clinics.fteotherspec2_present is
  '1.09.n Entry Present? - FTE for Other Specialty 2';
comment on column source.y3_continuity_clinics.fteotherspec2 is
  '1.09.n Number of clinical staff FTEs for Other Specialty 2';
comment on column source.y3_continuity_clinics.fteotherspec2txt is
  '1.09.o Number of clinical staff FTEs for Other Specialty 2 Text';
comment on column source.y3_continuity_clinics.numnp is
  '1.10.a Number of Nurse Practioners taught in clinic over the past year';
comment on column source.y3_continuity_clinics.numpa is
  '1.10.b Number of Physicians Assistants taught in clinic over the past year';
comment on column source.y3_continuity_clinics.numrnlpn is
  '1.10.c Number of Nursing Staff RN/LPN taught in clinic over the past year';
comment on column source.y3_continuity_clinics.numma is
  '1.10.d Number of Medical Assistants taught in clinic over the past year';
comment on column source.y3_continuity_clinics.numallied is
  '1.10.e Number of Allied Health Staff taught in clinic over the past year';
comment on column source.y3_continuity_clinics.numpsych is
  '1.10.f Number of Psychologists taught in clinic over the past year';
comment on column source.y3_continuity_clinics.numsocial is
  '1.10.g Number of Social Workers taught in clinic over the past year';
comment on column source.y3_continuity_clinics.numdiet is
  '1.10.h Number of Dieticians taught in clinic over the past year';
comment on column source.y3_continuity_clinics.numpteduc is
  '1.10.i Number of Patient Educators taught in clinic over the past year';
comment on column source.y3_continuity_clinics.numotherspec_present is
  '1.10.j Entry Present? - Number of Other Specialty taught in clinic over past year';
comment on column source.y3_continuity_clinics.numotherspec is
  '1.10.j Number of Other Specialty taught in clinic over the past year';
comment on column source.y3_continuity_clinics.numotherspectxt is
  '1.10.k Other Specialty taught in clinic over the past year Text';
comment on column source.y3_continuity_clinics.integrated is
  '1.11 Currently part of an integrated health system (with specialists in hospital)';
comment on column source.y3_continuity_clinics.owner is
  '1.12.a Practice affiliation/ownership';
comment on column source.y3_continuity_clinics.ownerother is
  '1.12.b Owner other Text';
comment on column source.y3_continuity_clinics.male is
  '2.01.a Percent male patients';
comment on column source.y3_continuity_clinics.female is
  '2.01.b Percent female patients';
comment on column source.y3_continuity_clinics.gendersource is
  '2.01.c Source of patient gender estimates';
comment on column source.y3_continuity_clinics.lt3 is
  '2.02.1 Percent of patients under 3 years';
comment on column source.y3_continuity_clinics.three is
  '2.02.2 Percent of patients between 3-17 years';
comment on column source.y3_continuity_clinics.eighteen is
  '2.02.3 Percent of patients between 18-24 years';
comment on column source.y3_continuity_clinics.twentyfive is
  '2.02.4 Percent of patients between 25-44 years';
comment on column source.y3_continuity_clinics.fortyfive is
  '2.02.5 Percent of patients between 45-64 years';
comment on column source.y3_continuity_clinics.sixtyfive is
  '2.02.6 Percent of patients between 65-74 years';
comment on column source.y3_continuity_clinics.seventyfive is
  '2.02.7 Percent of patients 75 years and older';
comment on column source.y3_continuity_clinics.agesource is
  '2.02.8 Source of patient age estimates';
comment on column source.y3_continuity_clinics.hispanic is
  '2.03.1 Percent Hispanic or Latino patients';
comment on column source.y3_continuity_clinics.nonhispanic is
  '2.03.2 Percent Not Hispanic or Latino patients';
comment on column source.y3_continuity_clinics.ethnicitysource is
  '2.03.3 Source of Ethnicity Data';
comment on column source.y3_continuity_clinics.indian is
  '2.04.1 Percent American Indian/Native American patients';
comment on column source.y3_continuity_clinics.asian is
  '2.04.2 Percent Asian patients';
comment on column source.y3_continuity_clinics.black is
  '2.04.3 Percent Black/African American patients';
comment on column source.y3_continuity_clinics.hawaiian is
  '2.04.4 Percent Hawaiian patients';
comment on column source.y3_continuity_clinics.white is
  '2.04.5 Percent White patients';
comment on column source.y3_continuity_clinics.otherrace_present is
  '2.04.6 Entry Present? - Percent Other Race patients';
comment on column source.y3_continuity_clinics.otherrace is
  '2.04.6 Percent Other Race patients';
comment on column source.y3_continuity_clinics.otherracetxt is
  '2.04.6 Name of Other Race';
comment on column source.y3_continuity_clinics.racesource is
  '2.04.7 Source of patient race estimates';
comment on column source.y3_continuity_clinics.prepaid is
  '2.05.1 Percent Private Health Insurance (Prepaid)';
comment on column source.y3_continuity_clinics.ffs is
  '2.05.2 Percent Private Health Insurance (Fee for service)';
comment on column source.y3_continuity_clinics.medicare is
  '2.05.3 Percent Medicare';
comment on column source.y3_continuity_clinics.medicaid is
  '2.05.4 Percent Medicaid';
comment on column source.y3_continuity_clinics.otherpay_present is
  '2.05.5 Entry Present? - Percent Other Payment Method';
comment on column source.y3_continuity_clinics.otherpay is
  '2.05.5 Percent Other Payment Method';
comment on column source.y3_continuity_clinics.otherpaytxt is
  '2.05.5 Name of Other Payment Method';
comment on column source.y3_continuity_clinics.uninsured is
  '2.05.6 Percent Uninsured';
comment on column source.y3_continuity_clinics.paysource is
  '2.05.7 Source of payment method estimates';
comment on column source.y3_continuity_clinics.xrays is
  '2.06 Where majority of patients go for routine x-rays';
comment on column source.y3_continuity_clinics.statemr is
  'Status of EMR';
comment on column source.y3_continuity_clinics.statpaperless is
  'Status of paperless';
comment on column source.y3_continuity_clinics.statremote is
  'Status of remote access';
comment on column source.y3_continuity_clinics.stattranscription is
  'Status of transcription expense';
comment on column source.y3_continuity_clinics.statscheduling is
  'Status of electronic scheduling';
comment on column source.y3_continuity_clinics.statbilling is
  'Status of electronic billing';
comment on column source.y3_continuity_clinics.statorders is
  'Status of electronic orders';
comment on column source.y3_continuity_clinics.stathospemr is
  'Status of hospital EMR';
comment on column source.y3_continuity_clinics.statptcommunication is
  'Status of asynchronous communication with patients';
comment on column source.y3_continuity_clinics.statprovcommunication is
  'Status of asynchronous communication with other providers';
comment on column source.y3_continuity_clinics.statqa is
  'Status of population-based QA using EMR';
comment on column source.y3_continuity_clinics.statdisregistry is
  'Status of chronic disease management registries';
comment on column source.y3_continuity_clinics.statprevregistry is
  'Status of EMB-based preventive services registries';
comment on column source.y3_continuity_clinics.statresearch is
  'Status of practice-based research using EMR';
comment on column source.y3_continuity_clinics.statopenaccess is
  'Status of open-access scheduling';
comment on column source.y3_continuity_clinics.statexpandedhrs is
  'Status of expanded hours';
comment on column source.y3_continuity_clinics.stattelephone is
  'Status of functional quality monitoring telephone system';
comment on column source.y3_continuity_clinics.statnetscheduling is
  'Status of full asynchronous pateint-accessible scheduling';
comment on column source.y3_continuity_clinics.statsurvey is
  'Status of patient satisfaction survey';
comment on column source.y3_continuity_clinics.statspace is
  'Status of sufficient and adequate physical space';
comment on column source.y3_continuity_clinics.statparking is
  'Status of adequate, free parking';
comment on column source.y3_continuity_clinics.stattransit is
  'Status of convenient public transportation';
comment on column source.y3_continuity_clinics.statteams is
  'Status of using teams to manage patient care';
comment on column source.y3_continuity_clinics.statpsych is
  'Status of integrated behavioral health';
comment on column source.y3_continuity_clinics.statcasemgt is
  'Status of integrated case management';
comment on column source.y3_continuity_clinics.statpharm is
  'Status of clinical pharmacy support';
comment on column source.y3_continuity_clinics.statgroup is
  'Status of group visits';
comment on column source.y3_continuity_clinics.statptcentered is
  'Overall status of practice as patient-centered vs. physician-centered';
comment on column source.y3_continuity_clinics.emrimplemented is
  'Has your practice implemented an Electronic Medical Record (EMR) system?';
comment on column source.y3_continuity_clinics.emryears is
  'For how many years has your practice had an Electronic Medical Record (EMR) system?';
comment on column source.y3_continuity_clinics.emrexplain is
  'Why has your practice not implemented an EMR system?';
comment on column source.y3_continuity_clinics.emrptsafety is
  'Is your practice using its EMR system for patient safety?';
comment on column source.y3_continuity_clinics.emrptsafetytxt is
  'How is your practice using its EMR system for patient safety?';

