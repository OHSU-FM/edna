begin transaction;

create table source.y1_webads_responses
(
  p4_program_id varchar not null,
  pgy1activeFullTime bigint,
  pgy1activePartTime bigint,
  pgy1Completed bigint,
  pgy2activeFullTime bigint,
  pgy2activePartTime bigint,
  pgy2Completed bigint,
  pgy3activeFullTime bigint,
  pgy3activePartTime bigint,
  pgy3Completed bigint,
  pgy4activeFullTime bigint,
  pgy4activePartTime bigint,
  pgy4Completed bigint,
  dailyPtsAdultYr1 numeric,
  dailyPtsAdultYr2 numeric,
  dailyPtsAdultYr3 numeric,
  dailyPtsNewbornYr1 numeric,
  dailyPtsNewbornYr2 numeric,
  dailyPtsNewbornYr3 numeric,
  dailyPtsPedsYr1 numeric,
  dailyPtsPedsYr2 numeric,
  dailyPtsPedsYr3 numeric,
  nstCst bigint,
  injectionAsp bigint,
  omt bigint,
  castRemoval bigint,
  circumcision bigint,
  treadmill bigint,
  ekg bigint,
  spirometry bigint,
  intubation bigint,
  vasectomy bigint,
  skinBiopsy bigint,
  cryosurgery bigint,
  skinIandD bigint,
  ingrownToenail bigint,
  lacRepair bigint,
  papSmear bigint,
  bartholin bigint,
  iud bigint,
  endometrialBx bigint,
  curettage bigint,
  colposcopy bigint,
  obUltrasound bigint,
  genitalWarts bigint,
  catheter bigint,
  cerumenRemoval bigint,
  eyeFB bigint,
  ivStart bigint,

  primary key (p4_program_id)
);


comment on column source.y1_webads_responses.p4_program_id is
  'P4-Assigned Residency ID';
comment on column source.y1_webads_responses.pgy1activefulltime is
  '# PGY 1 residents active full time';
comment on column source.y1_webads_responses.pgy1activeparttime is
  '# PGY 1 residents active part time';
comment on column source.y1_webads_responses.pgy1completed is
  '# PGY 1 residents completed all training';
comment on column source.y1_webads_responses.pgy2activefulltime is
  '# PGY 2 residents active full time';
comment on column source.y1_webads_responses.pgy2activeparttime is
  '# PGY 2 residents active part time';
comment on column source.y1_webads_responses.pgy2completed is
  '# PGY 2 residents completed all training';
comment on column source.y1_webads_responses.pgy3activefulltime is
  '# PGY 3 residents active full time';
comment on column source.y1_webads_responses.pgy3activeparttime is
  '# PGY 3 residents active part time';
comment on column source.y1_webads_responses.pgy3completed is
  '# PGY 3 residents completed all training';
comment on column source.y1_webads_responses.pgy4activefulltime is
  '# PGY 4 residents active full time';
comment on column source.y1_webads_responses.pgy4activeparttime is
  '# PGY 4 residents active part time';
comment on column source.y1_webads_responses.pgy4completed is
  '# PGY 4 residents completed all training';
comment on column source.y1_webads_responses.dailyptsadultyr1 is
  'Average # Adult patients managed daily - Y1';
comment on column source.y1_webads_responses.dailyptsadultyr2 is
  'Average # Adult patients managed daily - Y2';
comment on column source.y1_webads_responses.dailyptsadultyr3 is
  'Average # Adult patients managed daily - Y3';
comment on column source.y1_webads_responses.dailyptsnewbornyr1 is
  'Average # Newborn patients managed daily - Y1';
comment on column source.y1_webads_responses.dailyptsnewbornyr2 is
  'Average # Newborn patients managed daily - Y2';
comment on column source.y1_webads_responses.dailyptsnewbornyr3 is
  'Average # Newborn patients managed daily - Y3';
comment on column source.y1_webads_responses.dailyptspedsyr1 is
  'Average # Pediatric patients managed daily - Y1';
comment on column source.y1_webads_responses.dailyptspedsyr2 is
  'Average # Pediatric patients managed daily - Y2';
comment on column source.y1_webads_responses.dailyptspedsyr3 is
  'Average # Pediatric patients managed daily - Y3';
comment on column source.y1_webads_responses.nstcst is
  'WebAds Required Procedure - NST/CST Interpretation';
comment on column source.y1_webads_responses.injectionasp is
  'WebAds Required Procedure - Injection/Aspiration';
comment on column source.y1_webads_responses.omt is
  'WebAds Required Procedure - OMT';
comment on column source.y1_webads_responses.castremoval is
  'WebAds Required Procedure - Cast Removed';
comment on column source.y1_webads_responses.circumcision is
  'WebAds Required Procedure - Circumcision';
comment on column source.y1_webads_responses.treadmill is
  'WebAds Required Procedure - Cardiovascular Treadmill Test';
comment on column source.y1_webads_responses.ekg is
  'WebAds Required Procedure - EKG Interpretation';
comment on column source.y1_webads_responses.spirometry is
  'WebAds Required Procedure - Spirometry';
comment on column source.y1_webads_responses.intubation is
  'WebAds Required Procedure - Endotracheal Intubation of an adult, emergency';
comment on column source.y1_webads_responses.vasectomy is
  'WebAds Required Procedure - Vasectomy';
comment on column source.y1_webads_responses.skinbiopsy is
  'WebAds Required Procedure - Skin Bx/Lesion Removal';
comment on column source.y1_webads_responses.cryosurgery is
  'WebAds Required Procedure - Skin Cryosurgery';
comment on column source.y1_webads_responses.skiniandd is
  'WebAds Required Procedure - Skin I & D Abscess';
comment on column source.y1_webads_responses.ingrowntoenail is
  'WebAds Required Procedure - Ingrown toenail surgery';
comment on column source.y1_webads_responses.lacrepair is
  'WebAds Required Procedure - Laceration repair';
comment on column source.y1_webads_responses.papsmear is
  'WebAds Required Procedure - Pap Smear';
comment on column source.y1_webads_responses.bartholin is
  'WebAds Required Procedure - I & D Bartholin Cyst';
comment on column source.y1_webads_responses.iud is
  'WebAds Required Procedure - IUD Insertion/Removal';
comment on column source.y1_webads_responses.endometrialbx is
  'WebAds Required Procedure - Endometrial Biopsy';
comment on column source.y1_webads_responses.curettage is
  'WebAds Required Procedure - Endocervical Curettage';
comment on column source.y1_webads_responses.colposcopy is
  'WebAds Required Procedure - Colposcopy';
comment on column source.y1_webads_responses.obultrasound is
  'WebAds Required Procedure - OB Ultrasound';
comment on column source.y1_webads_responses.genitalwarts is
  'WebAds Required Procedure - Genital Wart Treatment';
comment on column source.y1_webads_responses.catheter is
  'WebAds Required Procedure - Bladder Catheter';
comment on column source.y1_webads_responses.cerumenremoval is
  'WebAds Required Procedure - Cerumen Removal';
comment on column source.y1_webads_responses.eyefb is
  'WebAds Required Procedure - Foreign Body Removal';
comment on column source.y1_webads_responses.ivstart is
  'WebAds Required Procedure - IV Start';



create table source.y2_webads_responses
(
  p4_program_id varchar not null,
  abfmresidencyid varchar not null,
  id varchar not null,
  pgy1activeFullTime bigint,
  pgy1activePartTime bigint,
  pgy1Completed bigint,
  pgy2activeFullTime bigint,
  pgy2activePartTime bigint,
  pgy2Completed bigint,
  pgy3activeFullTime bigint,
  pgy3activePartTime bigint,
  pgy3Completed bigint,
  pgy4activeFullTime bigint,
  pgy4activePartTime bigint,
  pgy4Completed bigint,
  dailyPtsAdultYr1 numeric,
  dailyPtsAdultYr2 numeric,
  dailyPtsAdultYr3 numeric,
  dailyPtsNewbornYr1 numeric,
  dailyPtsNewbornYr2 numeric,
  dailyPtsNewbornYr3 numeric,
  dailyPtsPedsYr1 numeric,
  dailyPtsPedsYr2 numeric,
  dailyPtsPedsYr3 numeric,

  primary key (p4_program_id)
);


comment on column source.y2_webads_responses.p4_program_id is
  'P4-Assigned Residency ID';
comment on column source.y2_webads_responses.abfmresidencyid is
  'ABFM-Assigned Residency ID';
comment on column source.y2_webads_responses.id is
  'Opaque internal identifier';
comment on column source.y2_webads_responses.pgy1activefulltime is
  '# PGY 1 residents active full time';
comment on column source.y2_webads_responses.pgy1activeparttime is
  '# PGY 1 residents active part time';
comment on column source.y2_webads_responses.pgy1completed is
  '# PGY 1 residents completed all training';
comment on column source.y2_webads_responses.pgy2activefulltime is
  '# PGY 2 residents active full time';
comment on column source.y2_webads_responses.pgy2activeparttime is
  '# PGY 2 residents active part time';
comment on column source.y2_webads_responses.pgy2completed is
  '# PGY 2 residents completed all training';
comment on column source.y2_webads_responses.pgy3activefulltime is
  '# PGY 3 residents active full time';
comment on column source.y2_webads_responses.pgy3activeparttime is
  '# PGY 3 residents active part time';
comment on column source.y2_webads_responses.pgy3completed is
  '# PGY 3 residents completed all training';
comment on column source.y2_webads_responses.pgy4activefulltime is
  '# PGY 4 residents active full time';
comment on column source.y2_webads_responses.pgy4activeparttime is
  '# PGY 4 residents active part time';
comment on column source.y2_webads_responses.pgy4completed is
  '# PGY 4 residents completed all training';
comment on column source.y2_webads_responses.dailyptsadultyr1 is
  'Average # Adult patients managed daily - Y1';
comment on column source.y2_webads_responses.dailyptsadultyr2 is
  'Average # Adult patients managed daily - Y2';
comment on column source.y2_webads_responses.dailyptsadultyr3 is
  'Average # Adult patients managed daily - Y3';
comment on column source.y2_webads_responses.dailyptsnewbornyr1 is
  'Average # Newborn patients managed daily - Y1';
comment on column source.y2_webads_responses.dailyptsnewbornyr2 is
  'Average # Newborn patients managed daily - Y2';
comment on column source.y2_webads_responses.dailyptsnewbornyr3 is
  'Average # Newborn patients managed daily - Y3';
comment on column source.y2_webads_responses.dailyptspedsyr1 is
  'Average # Pediatric patients managed daily - Y1';
comment on column source.y2_webads_responses.dailyptspedsyr2 is
  'Average # Pediatric patients managed daily - Y2';
comment on column source.y2_webads_responses.dailyptspedsyr3 is
  'Average # Pediatric patients managed daily - Y3';


create table source.p4_webads_rankings
(
  p4_program_id varchar not null,
  ranking_type_id integer not null,
  rank integer not null,
  name varchar not null,
  year integer not null
);

commit;
