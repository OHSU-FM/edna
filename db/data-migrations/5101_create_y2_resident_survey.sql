create table source.y2_resident_responses
(
  p4residency_abfm_id varchar not null,
  p4_program_id varchar not null,
  abfm_last_four bigint null,
  p4resid varchar null,
  contclin varchar null,
  age bigint null,
  gender bigint null,
  race_c bigint null,
  race_aa bigint null,
  race_ap bigint null,
  race_in bigint null,
  race_o bigint null,
  raceOtherTxt varchar null,
  ethnicity bigint null,
  marital bigint null,
  children bigint null,
  many bigint null,
  medicalAfterBS bigint null,
  yearsBeforeMedSchool bigint null,
  describeBeforeMed varchar null,
  usaMedSchool bigint null,
  firstGenerationCollege bigint null,
  firstGenPhysician bigint null,
  firstFamilyPhysician bigint null,
  medGradDate varchar null,
  programYear bigint null,
  otherProgramYear varchar null,
  influence bigint null,
  masters bigint null,
  mastersDegree varchar null,
  mastersDegreeOther varchar null,
  goals bigint null,
  facultyTeaching bigint null,
  facultySupervising bigint null,
  participationJournalClub bigint null,
  participationConferences bigint null,
  feedback bigint null,
  evaluateFaculty bigint null,
  evaluateProgram bigint null,
  speakFreely bigint null,
  otherTraineesInterfere bigint null,
  satisfied bigint null,
  strengthsFacTeaching bigint null,
  strengthsOverallCurr bigint null,
  strengthsCurrChange bigint null,
  strengthsPracChange bigint null,
  strengthsCompetence bigint null,
  strengthsP4Innovations bigint null,
  strengthsP4Implement bigint null,
  importance1 bigint null,
  importance2 bigint null,
  importance3 bigint null,
  importance4 bigint null,
  importance5 bigint null,
  importance6 bigint null,
  importance7 bigint null,
  importance8 bigint null,
  importance9 bigint null,
  importance10 bigint null,
  importance11 bigint null,
  importance12 bigint null,
  importance13 bigint null,
  importance14 bigint null,
  importance15 bigint null,
  importance16 bigint null,
  importance17 bigint null,
  importance18 bigint null,
  importance19 bigint null,
  importance20 bigint null,
  importance21 bigint null,
  importance22 bigint null,
  importance23 bigint null,
  importance24 bigint null,
  importance25 bigint null,
  importance26 bigint null,
  importance27 bigint null,

  foreign key (p4_program_id)
    references source.y2_residency_programs (p4_program_id)
);

comment on column source.y2_resident_responses.p4residency_abfm_id is
  'ABFM Residency Program ID';
comment on column source.y2_resident_responses.p4_program_id is
  'P4-Assgined Residency ID';
comment on column source.y2_resident_responses.abfm_last_four is
  'Last 4 digits of residents 2008 ABFM ID';
comment on column source.y2_resident_responses.p4resid is
  'Unique P4-Assigned Resident ID';
comment on column source.y2_resident_responses.contclin is
  'Residents Continuity Clinic Assignement for 2007-2008';
comment on column source.y2_resident_responses.age is
  '1.01 Resident age in years';
comment on column source.y2_resident_responses.gender is
  '1.02 Resident gender';
comment on column source.y2_resident_responses.race_c is
  '1.03 Race: White';
comment on column source.y2_resident_responses.race_aa is
  '1.03 Race: Black';
comment on column source.y2_resident_responses.race_ap is
  '1.03 Race: Asian or Pacific Islander';
comment on column source.y2_resident_responses.race_in is
  '1.03 Race: American Indian or Alaska Native';
comment on column source.y2_resident_responses.race_o is
  '1.03 Race: Other';
comment on column source.y2_resident_responses.raceothertxt is
  'Race: Other text';
comment on column source.y2_resident_responses.ethnicity is
  '1.04 Ethnicity: Of hispanic origin';
comment on column source.y2_resident_responses.marital is
  '1.05 Current marital status';
comment on column source.y2_resident_responses.children is
  '1.06 Have children';
comment on column source.y2_resident_responses.many is
  '1.06 How many children';
comment on column source.y2_resident_responses.medicalafterbs is
  '1.07 Enter med school immediately after completing bachelors';
comment on column source.y2_resident_responses.yearsbeforemedschool is
  'If NO, Years between undergrad and medical school';
comment on column source.y2_resident_responses.describebeforemed is
  'If NO, Text for years before medical school';
comment on column source.y2_resident_responses.usamedschool is
  '1.08 Attend med school in United States';
comment on column source.y2_resident_responses.firstgenerationcollege is
  '1.09 First generation college graduate';
comment on column source.y2_resident_responses.firstgenphysician is
  '1.10 First person in family to become a physician';
comment on column source.y2_resident_responses.firstfamilyphysician is
  '1.10 If NO, First family physician in family';
comment on column source.y2_resident_responses.medgraddate is
  '1.11 Date graduated from med school';
comment on column source.y2_resident_responses.programyear is
  '1.12 Current Program Year';
comment on column source.y2_resident_responses.otherprogramyear is
  'Other program year text';
comment on column source.y2_resident_responses.influence is
  '1.13 P4 Influence decision to rank program in match';
comment on column source.y2_resident_responses.masters is
  '1.14 Working towards masters degree (MS, MPH, MBA)';
comment on column source.y2_resident_responses.mastersdegree is
  'If yes, type of masters degree';
comment on column source.y2_resident_responses.mastersdegreeother is
  'If yes, type of masters degree - other';
comment on column source.y2_resident_responses.goals is
  '2.01 Program provided access to written goals & objectives for each rotation';
comment on column source.y2_resident_responses.facultyteaching is
  '2.03 Faculty spend sufficient time teaching residents';
comment on column source.y2_resident_responses.facultysupervising is
  '2.03 Faculty spend sufficient time supervising residents';
comment on column source.y2_resident_responses.participationjournalclub is
  '2.04 Faculty participation in journal club';
comment on column source.y2_resident_responses.participationconferences is
  '2.04 Faculty participation in conferences';
comment on column source.y2_resident_responses.feedback is
  '2.05 Receive written feedback on performance for each rotation';
comment on column source.y2_resident_responses.evaluatefaculty is
  '2.06 Opportunity to evaluate faculty at least once per year';
comment on column source.y2_resident_responses.evaluateprogram is
  '2.07 Opportunity to evaluate program at least once per year';
comment on column source.y2_resident_responses.speakfreely is
  '2.08 Able to speak freely about issues and problems without fear';
comment on column source.y2_resident_responses.othertraineesinterfere is
  '2.09 Other trainees interfere with or supplement education';
comment on column source.y2_resident_responses.satisfied is
  '2.11 Overall satisfaction with residency training thus far';
comment on column source.y2_resident_responses.strengthsfacteaching is
  '2.10 Strengths or weaknesses of program - Teaching';
comment on column source.y2_resident_responses.strengthsoverallcurr is
  '2.10 Strengths or weaknesses of program - Overall curriculum';
comment on column source.y2_resident_responses.strengthscurrchange is
  '2.10 Strengths/weaknesses of program - Resident involvement in curriculum change';
comment on column source.y2_resident_responses.strengthspracchange is
  '2.10 Strengths/weaknesses of program - Resident involvement in clinical practice change';
comment on column source.y2_resident_responses.strengthscompetence is
  '2.10 Strengths/weaknesses of program - Competence of faculty';
comment on column source.y2_resident_responses.strengthsp4innovations is
  '2.10 Strengths/weaknesses of program - Success conveying what P4 innovations are to you';
comment on column source.y2_resident_responses.strengthsp4implement is
  '2.10 Strengths/weaknesses of program - Success implementing P4 innovations';
comment on column source.y2_resident_responses.importance1 is
  'New Model Importance: EMR';
comment on column source.y2_resident_responses.importance2 is
  'New Model Importance: Paperless practice';
comment on column source.y2_resident_responses.importance3 is
  'New Model Importance: Secure remote access to clinical info';
comment on column source.y2_resident_responses.importance4 is
  'New Model Importance: Integrated transcription';
comment on column source.y2_resident_responses.importance5 is
  'New Model Importance: Electronic scheduling integrated with EMR';
comment on column source.y2_resident_responses.importance6 is
  'New Model Importance: Electronic billing integrated with EMR';
comment on column source.y2_resident_responses.importance7 is
  'New Model Importance: Electronic orders integrated with EMR';
comment on column source.y2_resident_responses.importance8 is
  'New Model Importance: Electronic prescribing integrated with EMR';
comment on column source.y2_resident_responses.importance9 is
  'New Model Importance: Hospital EMR w/full-computerized physician order entry';
comment on column source.y2_resident_responses.importance10 is
  'New Model Importance: HIPPA-compliant asynchronous communication with patients';
comment on column source.y2_resident_responses.importance11 is
  'New Model Importance: Asynchronous communication with other providers';
comment on column source.y2_resident_responses.importance12 is
  'New Model Importance: Ongoing population-based QA using EMR';
comment on column source.y2_resident_responses.importance13 is
  'New Model Importance: Chronic disease management registries';
comment on column source.y2_resident_responses.importance14 is
  'New Model Importance: EMR-based preventive services';
comment on column source.y2_resident_responses.importance15 is
  'New Model Importance: Doing any practice-based research';
comment on column source.y2_resident_responses.importance16 is
  'New Model Importance: Doing practice-based research using EMR';
comment on column source.y2_resident_responses.importance17 is
  'New Model Importance: Advanced or open-access scheduling';
comment on column source.y2_resident_responses.importance18 is
  'New Model Importance: Expanded hours';
comment on column source.y2_resident_responses.importance19 is
  'New Model Importance: Functional quality monitoring telephone system';
comment on column source.y2_resident_responses.importance20 is
  'New Model Importance: Full asynchronous patient-accessible scheduling';
comment on column source.y2_resident_responses.importance21 is
  'New Model Importance: Credible, reliable patient satisfaction survey';
comment on column source.y2_resident_responses.importance22 is
  'New Model Importance: Teams managing patient care';
comment on column source.y2_resident_responses.importance23 is
  'New Model Importance: Integrated behavioral health';
comment on column source.y2_resident_responses.importance24 is
  'New Model Importance: Integrated case management';
comment on column source.y2_resident_responses.importance25 is
  'New Model Importance: Clinical pharmacy support';
comment on column source.y2_resident_responses.importance26 is
  'New Model Importance: Group visits';
comment on column source.y2_resident_responses.importance27 is
  'New Model Importance: Practice being patient-centered versus physician-centered';

