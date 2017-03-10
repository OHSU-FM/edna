create table source.y1_continuity_clinics
(
  p4_program_id varchar not null,
  SettingID varchar not null,
  teachingSite varchar null,
  learningSetting bigint null,
  learningSettingTxt varchar null,
  ptAssigned bigint null,
  pgy1Routine numeric(11, 2) null,
  pgy2Routine numeric(11, 2) null,
  pgy3Routine numeric(11, 2) null,
  pgy4Routine numeric(11, 2) null,
  pgy1Acute numeric(11, 2) null,
  pgy2Acute numeric(11, 2) null,
  pgy3Acute numeric(11, 2) null,
  pgy4Acute numeric(11, 2) null,
  daysNewApptFac bigint null,
  daysNewApptRes bigint null,
  daysFuApptFac bigint null,
  daysFuApptRes bigint null,
  daysAcuteApptFac bigint null,
  daysAcuteApptRes bigint null,
  numExamRooms bigint null,
  numPtLastYrFac bigint null,
  numPtLastYrRes bigint null,
  fteFP numeric(11, 2) null,
  fteFMRes numeric(11, 2) null,
  ftePed numeric(11, 2) null,
  ftePedRes numeric(11, 2) null,
  fteIM numeric(11, 2) null,
  fteIMRes numeric(11, 2) null,
  fteOB numeric(11, 2) null,
  fteOBRes numeric(11, 2) null,
  fteOtherPhys1 numeric(11, 2) null,
  fteOtherPhys1Txt varchar null,
  fteOtherPhys2 numeric(11, 2) null,
  fteOtherPhys2Txt varchar null,
  fteOtherPhys3 numeric(11, 2) null,
  fteOtherPhys3Txt varchar null,
  fteNP numeric(11, 2) null,
  ftePA numeric(11, 2) null,
  fteRNLPN numeric(11, 2) null,
  fteMA numeric(11, 2) null,
  fteAllied numeric(11, 2) null,
  fteAdmin numeric(11, 2) null,
  ftePsych numeric(11, 2) null,
  fteSocial numeric(11, 2) null,
  fteDiet numeric(11, 2) null,
  ftePtEduc numeric(11, 2) null,
  fteOtherSpec1 numeric(11, 2) null,
  fteOtherSpec1Txt varchar null,
  fteOtherSpec2 numeric(11, 2) null,
  fteOtherSpec2Txt varchar null,
  fteOtherSpec3 numeric(11, 2) null,
  fteOtherSpec3Txt varchar null,
  numNP bigint null,
  numPA bigint null,
  numRNLPN bigint null,
  numMA bigint null,
  numAllied bigint null,
  numPsych bigint null,
  numSocial bigint null,
  numDiet bigint null,
  numPtEduc bigint null,
  numOtherSpec bigint null,
  numOtherSpecTxt varchar null,
  integrated bigint null,
  statEMR bigint null,
  statPaperless bigint null,
  statRemote bigint null,
  statTranscription bigint null,
  statScheduling bigint null,
  statBilling bigint null,
  statOrders bigint null,
  statHospEMR bigint null,
  statPtCommunication bigint null,
  statProvCommunication bigint null,
  statQA bigint null,
  statDisRegistry bigint null,
  statPrevRegistry bigint null,
  statResearch bigint null,
  statOpenAccess bigint null,
  statExpandedHrs bigint null,
  statTelephone bigint null,
  statNetScheduling bigint null,
  statSurvey bigint null,
  statSpace bigint null,
  statParking bigint null,
  statPublicTrans bigint null,
  statTeams bigint null,
  statBehavior bigint null,
  statCaseMgmt bigint null,
  statPharmacy bigint null,
  statGroup bigint null,
  statPtCentered bigint null,
  EMRBrand varchar null,
  EMRVersion varchar null,
  EMRYrs bigint null,
  EMRMonths bigint null,
  EMRforClinQual bigint null,
  EMRforClinQualTxt varchar null,
  EMRforQualSafe bigint null,
  EMRforQualSafeTxt varchar null,
  noEMR varchar null,

  primary key (p4_program_id, SettingID),

  unique (SettingID),

  foreign key (p4_program_id)
    references source.y1_residency_programs (p4_program_id)
);


comment on column source.y1_continuity_clinics.p4_program_id is
  'Unique P4 - Assigned Residency Program ID';
comment on column source.y1_continuity_clinics.settingid is
  'P4 Residency ID';
comment on column source.y1_continuity_clinics.teachingsite is
  'Residency Program Type';
comment on column source.y1_continuity_clinics.learningsetting is
  '1.02 Learning setting for this practice';
comment on column source.y1_continuity_clinics.learningsettingtxt is
  '1.02 Other learning setting text';
comment on column source.y1_continuity_clinics.ptassigned is
  '1.03 Patients assigned to personal physician';
comment on column source.y1_continuity_clinics.pgy1routine is
  '1.04 % Routine visits - PGY 1';
comment on column source.y1_continuity_clinics.pgy2routine is
  '1.04 % Routine visits - PGY 2';
comment on column source.y1_continuity_clinics.pgy3routine is
  '1.04 % Routine visits - PGY 3';
comment on column source.y1_continuity_clinics.pgy4routine is
  '1.04 % Routine visits - PGY 4';
comment on column source.y1_continuity_clinics.pgy1acute is
  '1.04 % Acute visits - PGY 1';
comment on column source.y1_continuity_clinics.pgy2acute is
  '1.04 % Acute visits - PGY 2';
comment on column source.y1_continuity_clinics.pgy3acute is
  '1.04 % Acute visits - PGY 3';
comment on column source.y1_continuity_clinics.pgy4acute is
  '1.04 % Acute visits - PGY 4';
comment on column source.y1_continuity_clinics.daysnewapptfac is
  '1.05 Average days to first new patient appt. - faculty';
comment on column source.y1_continuity_clinics.daysnewapptres is
  '1.05 Average days to first new patient appt. - residents';
comment on column source.y1_continuity_clinics.daysfuapptfac is
  '1.05 Average days to first follow-up appt. - faculty';
comment on column source.y1_continuity_clinics.daysfuapptres is
  '1.05 Average days to first follow-up appt. - residents';
comment on column source.y1_continuity_clinics.daysacuteapptfac is
  '1.06 Average days to first acute appt.- faculty';
comment on column source.y1_continuity_clinics.daysacuteapptres is
  '1.07 Average days to first acute appt.- residents';
comment on column source.y1_continuity_clinics.numexamrooms is
  '1.08 # of exam rooms';
comment on column source.y1_continuity_clinics.numptlastyrfac is
  '1.09.a # patients seen last year - faculty';
comment on column source.y1_continuity_clinics.numptlastyrres is
  '1.09.b # patients seen last year - residents';
comment on column source.y1_continuity_clinics.ftefp is
  '1.10 # FTEs - Family Physicians';
comment on column source.y1_continuity_clinics.ftefmres is
  '1.10 # FTEs - Family Medicine Residents, Fellows';
comment on column source.y1_continuity_clinics.fteped is
  '1.10 # FTEs - Pediatricians';
comment on column source.y1_continuity_clinics.ftepedres is
  '1.10 # FTEs - Pediatric Residents';
comment on column source.y1_continuity_clinics.fteim is
  '1.10 # FTEs - Internists';
comment on column source.y1_continuity_clinics.fteimres is
  '1.10 # FTEs - Internal Medicine Residents';
comment on column source.y1_continuity_clinics.fteob is
  '1.10 # FTEs - OB/GYN Physicians';
comment on column source.y1_continuity_clinics.fteobres is
  '1.10 # FTEs - OB/GYN Residents';
comment on column source.y1_continuity_clinics.fteotherphys1 is
  '1.10 # FTEs - Other Specialty #1';
comment on column source.y1_continuity_clinics.fteotherphys1txt is
  '1.10 # FTEs - Other Specialty #1 Text';
comment on column source.y1_continuity_clinics.fteotherphys2 is
  '1.10 # FTEs - Other Specialty #2';
comment on column source.y1_continuity_clinics.fteotherphys2txt is
  '1.10 # FTEs - Other Specialty #2 Text';
comment on column source.y1_continuity_clinics.fteotherphys3 is
  '1.10 # FTEs - Other Specialty #3';
comment on column source.y1_continuity_clinics.fteotherphys3txt is
  '1.10 # FTEs - Other Specialty #3 Text';
comment on column source.y1_continuity_clinics.ftenp is
  '1.11 # FTEs - Nurse Practitioners';
comment on column source.y1_continuity_clinics.ftepa is
  '1.11 # FTEs - Physician Assistants';
comment on column source.y1_continuity_clinics.fternlpn is
  '1.11 # FTEs - RNs and LPNs';
comment on column source.y1_continuity_clinics.ftema is
  '1.11 # FTEs - Medical Assistants';
comment on column source.y1_continuity_clinics.fteallied is
  '1.11 # FTEs - Allied Health Staff';
comment on column source.y1_continuity_clinics.fteadmin is
  '1.11 # FTEs - Administrative Staff';
comment on column source.y1_continuity_clinics.ftepsych is
  '1.11 # FTEs - Psychologists';
comment on column source.y1_continuity_clinics.ftesocial is
  '1.11 # FTEs - Social Workers';
comment on column source.y1_continuity_clinics.ftediet is
  '1.11 # FTEs - Dieticians';
comment on column source.y1_continuity_clinics.ftepteduc is
  '1.11 # FTEs - Patient Educators';
comment on column source.y1_continuity_clinics.fteotherspec1 is
  '1.11 # FTEs - Other Specialty #1';
comment on column source.y1_continuity_clinics.fteotherspec1txt is
  '1.11 # FTEs - Other Specialty #1 Text';
comment on column source.y1_continuity_clinics.fteotherspec2 is
  '1.11 # FTEs - Other Specialty #2';
comment on column source.y1_continuity_clinics.fteotherspec2txt is
  '1.11 # FTEs - Other Specialty #2 Text';
comment on column source.y1_continuity_clinics.fteotherspec3 is
  '1.11 # FTEs - Other Specialty #3';
comment on column source.y1_continuity_clinics.fteotherspec3txt is
  '1.11 # FTEs - Other Specialty #3 Text';
comment on column source.y1_continuity_clinics.numnp is
  '1.12 # Staff Members - Nurse Practitioners';
comment on column source.y1_continuity_clinics.numpa is
  '1.12 # Staff Members - Physician Assistants';
comment on column source.y1_continuity_clinics.numrnlpn is
  '1.12 # Staff Members - RNs and LPNs';
comment on column source.y1_continuity_clinics.numma is
  '1.12 # Staff Members - Medical Assistant';
comment on column source.y1_continuity_clinics.numallied is
  '1.12 # Staff Members - Allied Health Staff';
comment on column source.y1_continuity_clinics.numpsych is
  '1.12 # Staff Members - Psychologists';
comment on column source.y1_continuity_clinics.numsocial is
  '1.12 # Staff Members - Social Workers';
comment on column source.y1_continuity_clinics.numdiet is
  '1.12 # Staff Members - Dieticians';
comment on column source.y1_continuity_clinics.numpteduc is
  '1.12 # Staff Members - Patient Educators';
comment on column source.y1_continuity_clinics.numotherspec is
  '1.12 # Staff Members - Other Specialty';
comment on column source.y1_continuity_clinics.numotherspectxt is
  '1.12 # Staff Members - Other Specialty';
comment on column source.y1_continuity_clinics.integrated is
  '1.14 Part of an integrated health system?';
comment on column source.y1_continuity_clinics.statemr is
  'New Model Status: EMR';
comment on column source.y1_continuity_clinics.statpaperless is
  'New Model Status: Paperless practice';
comment on column source.y1_continuity_clinics.statremote is
  'New Model Status: Full secured remote access';
comment on column source.y1_continuity_clinics.stattranscription is
  'New Model Status: Transcription expense';
comment on column source.y1_continuity_clinics.statscheduling is
  'New Model Status: Electronic scheduling integrated w/EMR';
comment on column source.y1_continuity_clinics.statbilling is
  'New Model Status: Electronic billing integrated w/EMR';
comment on column source.y1_continuity_clinics.statorders is
  'New Model Status: Electronic orders integrated w/EMR';
comment on column source.y1_continuity_clinics.stathospemr is
  'New Model Status: Hospital EMR w/full-computerized physician order entry';
comment on column source.y1_continuity_clinics.statptcommunication is
  'New Model Status: HIPAA-compliant asynchronous communication w/patients';
comment on column source.y1_continuity_clinics.statprovcommunication is
  'New Model Status: Asynchronous communication w/other providers';
comment on column source.y1_continuity_clinics.statqa is
  'New Model Status: Ongoing population-based QA using EMR';
comment on column source.y1_continuity_clinics.statdisregistry is
  'New Model Status: Chronic disease management registries';
comment on column source.y1_continuity_clinics.statprevregistry is
  'New Model Status: EMB-based preventive services registries';
comment on column source.y1_continuity_clinics.statresearch is
  'New Model Status: Practice-based research using EMR';
comment on column source.y1_continuity_clinics.statopenaccess is
  'New Model Status: Advanced or open-access scheduling';
comment on column source.y1_continuity_clinics.statexpandedhrs is
  'New Model Status: Expanded clinic hours';
comment on column source.y1_continuity_clinics.stattelephone is
  'New Model Status: Quality monitoring telephone system';
comment on column source.y1_continuity_clinics.statnetscheduling is
  'New Model Status: Asynchronous patient-accessible scheduling';
comment on column source.y1_continuity_clinics.statsurvey is
  'New Model Status: Credible, reliable patient satisfaction survey';
comment on column source.y1_continuity_clinics.statspace is
  'New Model Status: Sufficient and adequate physical space';
comment on column source.y1_continuity_clinics.statparking is
  'New Model Status: Adequate, free parking';
comment on column source.y1_continuity_clinics.statpublictrans is
  'New Model Status: Convenient public transportation access';
comment on column source.y1_continuity_clinics.statteams is
  'New Model Status: Teams managing patient care';
comment on column source.y1_continuity_clinics.statbehavior is
  'New Model Status: Integrated behavioral health';
comment on column source.y1_continuity_clinics.statcasemgmt is
  'New Model Status: Integrated case management social services';
comment on column source.y1_continuity_clinics.statpharmacy is
  'New Model Status: Clinical pharmacy support';
comment on column source.y1_continuity_clinics.statgroup is
  'New Model Status: Group visits';
comment on column source.y1_continuity_clinics.statptcentered is
  'New Model Status: Practice as patient-centered vs physician-centered';
comment on column source.y1_continuity_clinics.emrbrand is
  '2.01 EMR Brand';
comment on column source.y1_continuity_clinics.emrversion is
  '2.01 EMR Version';
comment on column source.y1_continuity_clinics.emryrs is
  '2.02 Years EMR implemented';
comment on column source.y1_continuity_clinics.emrmonths is
  '2.02 Months EMR implemented';
comment on column source.y1_continuity_clinics.emrforclinqual is
  '2.03 Using EMR for clinical quality processes and/or projects';
comment on column source.y1_continuity_clinics.emrforclinqualtxt is
  '2.03 Text';
comment on column source.y1_continuity_clinics.emrforqualsafe is
  '2.04 Using EMR for quality and safety';
comment on column source.y1_continuity_clinics.emrforqualsafetxt is
  '2.04 Text';
comment on column source.y1_continuity_clinics.noemr is
  '2.05 If no EMR, why';

