CREATE TABLE source.y7_graduate_responses
(
  graduateid bigint,
  p4_program_id varchar,
  grad_year bigint null,
  abfm_last_four bigint null,
  paper bigint null,
  finished bigint null,
  max_slide bigint null,
  created_at varchar null,
  updated_at varchar null,
  q101a bigint null,
  q101b bigint null,
  q101c bigint null,
  q101d bigint null,
  q102a bigint null,
  q102b bigint null,
  q102c bigint null,
  q102d bigint null,
  q102d_other varchar null,
  q103a bigint null,
  q103b_1 bigint null,
  q103b_2 bigint null,
  q103b_3 bigint null,
  q103b_4 bigint null,
  q103b_5 bigint null,
  q103b_6 bigint null,
  q103b_7 bigint null,
  q103b_8 bigint null,
  q103b_9 bigint null,
  q103b_10 bigint null,
  q103b_other varchar null,
  q104 varchar null,
  q105 numeric null,
  q106 bigint null,
  q107_1 bigint null,
  q107_2 bigint null,
  q107_3 bigint null,
  q107_4 bigint null,
  q107_5 bigint null,
  q107_6 bigint null,
  q107_7 bigint null,
  q107_other varchar null,
  q108 bigint null,
  q201 bigint null,
  q201_other varchar null,
  q202_a bigint null,
  q202_b bigint null,
  q202_c bigint null,
  q202_d bigint null,
  q202_e bigint null,
  q202_f bigint null,
  q202_g bigint null,
  q202_h bigint null,
  q202_other varchar null,
  q202_none bigint null,
  q203 bigint null,
  q204 numeric null,
  q205 bigint null,
  q206 numeric null,
  q207a numeric null,
  q207b numeric null,
  q207c numeric null,
  q207d numeric null,
  q207e numeric null,
  q207f numeric null,
  q207f_other_present bigint null,
  q207f_other varchar null,
  q208 bigint null,
  q301a bigint null,
  q301b bigint null,
  q301c bigint null,
  q301d bigint null,
  q401 bigint null,
  q402 bigint null,
  q403 bigint null,
  q404 bigint null,
  q405 bigint null,
  q406 bigint null,
  q407 bigint null,
  q408 bigint null,
  q409 bigint null,
  q410 bigint null,
  q411 bigint null,
  q412 bigint null,
  q413 bigint null,
  q414 bigint null,
  q415 bigint null,
  q416 bigint null,
  q417 bigint null,
  q418 bigint null,
  q419 bigint null,
  q420 bigint null,
  q421 bigint null,
  q422 bigint null,
  q423 bigint null,
  q424 bigint null,
  q425 bigint null,
  q426 bigint null,
  q427 bigint null,
  q428 bigint null,
  q429 bigint null,
  q430 bigint null,
  q501a bigint null,
  q501b bigint null,
  q501c bigint null,
  q501d bigint null,
  q501e bigint null,
  q501f bigint null,
  q501g bigint null,
  q502 bigint null,
  q503 bigint null,
  q503_group bigint null,
  q503a bigint null,
  q503b bigint null,
  q504 bigint null,
  q504_describe varchar null,
  q505_1 bigint null,
  q505_2 bigint null,
  q505_3 bigint null,
  q505_4 bigint null,
  q505_other varchar null,
  q505_none bigint null,
  q506a bigint null,
  q506a_practiced bigint null,
  q506b bigint null,
  q506b_practiced bigint null,
  q506c bigint null,
  q506c_practiced bigint null,
  q506d bigint null,
  q506d_practiced bigint null,
  q506e bigint null,
  q506e_practiced bigint null,
  q507a bigint null,
  q507a_practiced bigint null,
  q507b bigint null,
  q507b_practiced bigint null,
  q507c bigint null,
  q507c_practiced bigint null,
  q507d bigint null,
  q507d_practiced bigint null,
  q507e bigint null,
  q507e_practiced bigint null,
  q507f bigint null,
  q507f_practiced bigint null,
  q507g bigint null,
  q507g_practiced bigint null,
  q507h bigint null,
  q507h_practiced bigint null,
  q507i bigint null,
  q507i_practiced bigint null,
  q507j bigint null,
  q507j_practiced bigint null,
  q508a bigint null,
  q508a_practiced bigint null,
  q508b bigint null,
  q508b_practiced bigint null,
  q508c bigint null,
  q508c_practiced bigint null,
  q508d bigint null,
  q508d_practiced bigint null,
  q508e bigint null,
  q508e_practiced bigint null,
  q508f bigint null,
  q508f_practiced bigint null,
  q508g bigint null,
  q508g_practiced bigint null,
  q509a bigint null,
  q509a_practiced bigint null,
  q509b bigint null,
  q509b_practiced bigint null,
  q509c bigint null,
  q509c_practiced bigint null,
  q510a bigint null,
  q510a_practiced bigint null,
  q510b bigint null,
  q510b_practiced bigint null,
  q510c bigint null,
  q510c_practiced bigint null,
  q510d bigint null,
  q510d_practiced bigint null,
  q510e bigint null,
  q510e_practiced bigint null,
  q510f bigint null,
  q510f_practiced bigint null,
  q510g bigint null,
  q510g_practiced bigint null,
  q510h bigint null,
  q510h_practiced bigint null,
  q511a bigint null,
  q511a_practiced bigint null,
  q511b bigint null,
  q511b_practiced bigint null,
  q511c bigint null,
  q511c_practiced bigint null,
  q512a bigint null,
  q512a_practiced bigint null,
  q512b bigint null,
  q512b_practiced bigint null,
  q513a bigint null,
  q513a_practiced bigint null,
  q513b bigint null,
  q513b_practiced bigint null,
  q513c bigint null,
  q513c_practiced bigint null,
  q513d bigint null,
  q513d_practiced bigint null,
  q513e bigint null,
  q513e_practiced bigint null,
  q514a bigint null,
  q514a_practiced bigint null,
  q514b bigint null,
  q514b_practiced bigint null,
  q514c bigint null,
  q514c_practiced bigint null,
  q514d bigint null,
  q514d_practiced bigint null,
  q514e bigint null,
  q514e_practiced bigint null,
  q514f bigint null,
  q514f_practiced bigint null,
  q514g bigint null,
  q514g_practiced bigint null,
  q514h bigint null,
  q514h_practiced bigint null,
  q514i bigint null,
  q514i_practiced bigint null,
  q514j bigint null,
  q514j_practiced bigint null,
  q601a bigint null,
  q601a_practiced bigint null,
  q601b bigint null,
  q601b_practiced bigint null,
  q601c bigint null,
  q601c_practiced bigint null,
  q601d bigint null,
  q601d_practiced bigint null,
  q601e bigint null,
  q601e_practiced bigint null,
  q602a bigint null,
  q602a_practiced bigint null,
  q602b bigint null,
  q602b_practiced bigint null,
  q602c bigint null,
  q602c_practiced bigint null,
  q602d bigint null,
  q602d_practiced bigint null,
  q602e bigint null,
  q602e_practiced bigint null,
  q603a bigint null,
  q603a_practiced bigint null,
  q603b bigint null,
  q603b_practiced bigint null,
  q603c bigint null,
  q603c_practiced bigint null,
  q603d bigint null,
  q603d_practiced bigint null,
  q603e bigint null,
  q603e_practiced bigint null,
  q603f bigint null,
  q603f_practiced bigint null,
  q604a bigint null,
  q604a_practiced bigint null,
  q604b bigint null,
  q604b_practiced bigint null,
  q604c bigint null,
  q604c_practiced bigint null,
  q604d bigint null,
  q604d_practiced bigint null,
  q605a bigint null,
  q605a_practiced bigint null,
  q605b bigint null,
  q605b_practiced bigint null,
  q606a bigint null,
  q606a_practiced bigint null,
  q606b bigint null,
  q606b_practiced bigint null,
  q606c bigint null,
  q606c_practiced bigint null,
  q606d bigint null,
  q606d_practiced bigint null,
  q606e bigint null,
  q606e_practiced bigint null,
  q606f bigint null,
  q606f_practiced bigint null,
  q606g bigint null,
  q606g_practiced bigint null,
  q606h bigint null,
  q606h_practiced bigint null,
  q606i bigint null,
  q606i_practiced bigint null,
  q701 varchar null
);

comment on column source.y7_graduate_responses.graduateid is 
  'Survey Login';
comment on column source.y7_graduate_responses.p4_program_id is 
  'P4 ID';
comment on column source.y7_graduate_responses.grad_year is 
  'Graduation Year';
comment on column source.y7_graduate_responses.abfm_last_four is 
  'Last four of ABFM ID';
comment on column source.y7_graduate_responses.paper is 
  'Paper survey?';
comment on column source.y7_graduate_responses.finished is 
  'Web survey finished?';
comment on column source.y7_graduate_responses.max_slide is 
  'Max slide reached';
comment on column source.y7_graduate_responses.created_at is 
  'Date created';
comment on column source.y7_graduate_responses.updated_at is 
  'Date updated';
comment on column source.y7_graduate_responses.q101a is 
  '1.01a - Are you board certified in Family Medicine (ABFM)?';
comment on column source.y7_graduate_responses.q101b is 
  '1.01b - In what year were you initially certified by the ABFM?';
comment on column source.y7_graduate_responses.q101c is 
  '1.01c - Are you planning on being certified by the ABFM?';
comment on column source.y7_graduate_responses.q101d is 
  '1.01d - In what year are you planning to be certified by the ABFM?';
comment on column source.y7_graduate_responses.q102a is 
  '1.02a - CAQ in adolescent medicine?';
comment on column source.y7_graduate_responses.q102b is 
  '1.02b - CAQ in geriatrics?';
comment on column source.y7_graduate_responses.q102c is 
  '1.02c - CAQ in sports medicine?';
comment on column source.y7_graduate_responses.q102d is 
  '1.02d - Board certification in other specialty or other CAQ?';
comment on column source.y7_graduate_responses.q102d_other is 
  '1.02e - For what other specialty / CAQ do you have a board certification?';
comment on column source.y7_graduate_responses.q103a is 
  '1.04 - Are you currently enrolled in or did you complete a fellowship after residency training?';
comment on column source.y7_graduate_responses.q103b_1 is 
  'Obstetrics / Maternity Care - 1.04a - What type of fellowship(s)?';
comment on column source.y7_graduate_responses.q103b_2 is 
  'Geriatrics - 1.04a - What type of fellowship(s)?';
comment on column source.y7_graduate_responses.q103b_3 is 
  'Sports Medicine - 1.04a - What type of fellowship(s)?';
comment on column source.y7_graduate_responses.q103b_4 is 
  'Research - 1.04a - What type of fellowship(s)?';
comment on column source.y7_graduate_responses.q103b_5 is 
  'Faculty Development - 1.04a - What type of fellowship(s)?';
comment on column source.y7_graduate_responses.q103b_6 is 
  'Pain Management - 1.04a - What type of fellowship(s)?';
comment on column source.y7_graduate_responses.q103b_7 is 
  'Hospitalist - 1.04a - What type of fellowship(s)?';
comment on column source.y7_graduate_responses.q103b_8 is 
  'Emergency Medicine - 1.04a - What type of fellowship(s)?';
comment on column source.y7_graduate_responses.q103b_9 is 
  'Rural Medicine - 1.04a - What type of fellowship(s)?';
comment on column source.y7_graduate_responses.q103b_10 is 
  'Other - 1.04a - What type of fellowship(s)?';
comment on column source.y7_graduate_responses.q103b_other is 
  'Other Text - 1.04a - What type of fellowship(s)?';
comment on column source.y7_graduate_responses.q104 is 
  '1.03 - In what state(s) are you currently practicing?';
comment on column source.y7_graduate_responses.q105 is 
  '1.05 - What is your age?';
comment on column source.y7_graduate_responses.q106 is 
  '1.06 - What is your gender?';
comment on column source.y7_graduate_responses.q107_1 is 
  'White - 1.07 - What is your race? (Check all that apply)';
comment on column source.y7_graduate_responses.q107_2 is 
  'Black - 1.07 - What is your race? (Check all that apply)';
comment on column source.y7_graduate_responses.q107_3 is 
  'Hispanic - 1.07 - What is your race? (Check all that apply)';
comment on column source.y7_graduate_responses.q107_4 is 
  'Asian / Pacific Islander - 1.07 - What is your race? (Check all that apply)';
comment on column source.y7_graduate_responses.q107_5 is 
  'American Indian or Alaska Native - 1.07 - What is your race? (Check all that apply)';
comment on column source.y7_graduate_responses.q107_6 is 
  'Middle Eastern - 1.07 - What is your race? (Check all that apply)';
comment on column source.y7_graduate_responses.q107_7 is 
  'Other - 1.07 - What is your race? (Check all that apply)';
comment on column source.y7_graduate_responses.q107_other is 
  '1.07 - What is your race? (Check all that apply)';
comment on column source.y7_graduate_responses.q108 is 
  '1.08 - What is your marital status? (Choose only one)';
comment on column source.y7_graduate_responses.q201 is 
  '2.01 - Which of the following best describes your current professional setting?';
comment on column source.y7_graduate_responses.q201_other is 
  '2.01 - Which of the following best describes your current professional setting?';
comment on column source.y7_graduate_responses.q202_a is 
  'HPSA: Federally designated health professional shortage area - 2.02 - Are you currently practicing in any of the following designated areas/practices?';
comment on column source.y7_graduate_responses.q202_b is 
  'MUA: Federally designated medically underserved area - 2.02 - Are you currently practicing in any of the following designated areas/practices?';
comment on column source.y7_graduate_responses.q202_c is 
  'MHC: Federally designated migrant health clinic - 2.02 - Are you currently practicing in any of the following designated areas/practices?';
comment on column source.y7_graduate_responses.q202_d is 
  'CHC: Federally designated community health clinic - 2.02 - Are you currently practicing in any of the following designated areas/practices?';
comment on column source.y7_graduate_responses.q202_e is 
  'RHC: Federally designated rural health clinic - 2.02 - Are you currently practicing in any of the following designated areas/practices?';
comment on column source.y7_graduate_responses.q202_f is 
  'NHSC: National Health Service Corps - 2.02 - Are you currently practicing in any of the following designated areas/practices?';
comment on column source.y7_graduate_responses.q202_g is 
  'IHS: Indian Health Service site - 2.02 - Are you currently practicing in any of the following designated areas/practices?';
comment on column source.y7_graduate_responses.q202_h is 
  'Other state or federally qualified health center / clinic - 2.02 - Are you currently practicing in any of the following designated areas/practices?';
comment on column source.y7_graduate_responses.q202_other is 
  'Other state or federally qualified health center / clinic - Text - 2.02 - Are you currently practicing in any of the following designated areas/practices?';
comment on column source.y7_graduate_responses.q202_none is 
  'None of the above - 2.02 - Are you currently practicing in any of the following designated areas/practices?';
comment on column source.y7_graduate_responses.q203 is 
  '2.03 - Which of the following best describes the community in which you practice?';
comment on column source.y7_graduate_responses.q204 is 
  '2.04 - How long in months have you been at your current practice location?';
comment on column source.y7_graduate_responses.q205 is 
  '2.05 - Number of office visits in an average full day. If you only work in half-day increments, multiply by 2 to get the full-day number.';
comment on column source.y7_graduate_responses.q206 is 
  '2.06 - Total hours per week worked (in all your professional activities) exclusive of on-call time out of the office.';
comment on column source.y7_graduate_responses.q207a is 
  'Private Insurance - 2.07 - Payor Mix';
comment on column source.y7_graduate_responses.q207b is 
  'Medicaid - 2.07 - Payor Mix';
comment on column source.y7_graduate_responses.q207c is 
  'Medicare - 2.07 - Payor Mix';
comment on column source.y7_graduate_responses.q207d is 
  'HMO / Managed Care - 2.07 - Payor Mix';
comment on column source.y7_graduate_responses.q207e is 
  'Self-Pay - 2.07 - Payor Mix';
comment on column source.y7_graduate_responses.q207f is 
  'Other - 2.07 - Payor Mix';
comment on column source.y7_graduate_responses.q207f_other_present is 
  'Other - Is Checked? - 2.07 - Payor Mix';
comment on column source.y7_graduate_responses.q207f_other is 
  'Other - Text Description - 2.07 - Payor Mix';
comment on column source.y7_graduate_responses.q208 is 
  '2.08 - What is your pre-tax yearly income, excluding benefits?';
comment on column source.y7_graduate_responses.q301a is 
  '3.01a - Family Medicine no longer has the appeal it used to have.';
comment on column source.y7_graduate_responses.q301b is 
  '3.01b - If I were to start my career over again, I would choose to be a family physician.';
comment on column source.y7_graduate_responses.q301c is 
  '3.01c - I would recommend family medicine to a student seeking advice.';
comment on column source.y7_graduate_responses.q301d is 
  '3.01d - Overall, my residency prepared me well for my current clinical practice';
comment on column source.y7_graduate_responses.q401 is 
  '4.01 - EMR (Electronic Medical Record) in your practice';
comment on column source.y7_graduate_responses.q402 is 
  '4.02 - Paperless Practice (all interfaces and scanning work - no paper charts)';
comment on column source.y7_graduate_responses.q403 is 
  '4.03 - Full secured remote access';
comment on column source.y7_graduate_responses.q404 is 
  '4.04 - Electronic Transcription (notes entered directly via templates or speech recognition)';
comment on column source.y7_graduate_responses.q405 is 
  '4.05 - Electronic scheduling system Integrated with EMR';
comment on column source.y7_graduate_responses.q406 is 
  '4.06 - Electronic billing system Integrated with EMR';
comment on column source.y7_graduate_responses.q407 is 
  '4.07 - Electronic orders (e.g., lab, x-ray) Integrated with EMR';
comment on column source.y7_graduate_responses.q408 is 
  '4.08 - Hospital EMR with full-computerized physician order entry';
comment on column source.y7_graduate_responses.q409 is 
  '4.09 - Secure HIPAA-compliant asynchronous communication (e.g. e-mail or text messaging) with patients';
comment on column source.y7_graduate_responses.q410 is 
  '4.10 - Asynchronous communication with other providers';
comment on column source.y7_graduate_responses.q411 is 
  '4.11 - Ongoing population-based Quality Assurance using an EMR / registry';
comment on column source.y7_graduate_responses.q412 is 
  '4.12 - Chronic disease management registries';
comment on column source.y7_graduate_responses.q413 is 
  '4.13 - EMR-based preventive services registries';
comment on column source.y7_graduate_responses.q414 is 
  '4.14 - Practice-based research using an EMR';
comment on column source.y7_graduate_responses.q415 is 
  '4.15 - Advanced or open-access scheduling';
comment on column source.y7_graduate_responses.q416 is 
  '4.16 - Expanded hours (e.g., clinic hours after 6 pm on weekdays/weekend clinic)';
comment on column source.y7_graduate_responses.q417 is 
  '4.17 - Functional quality monitoring telephone system (system to monitor call abandonment / time to answer)';
comment on column source.y7_graduate_responses.q418 is 
  '4.18 - Full asynchronous patient-accessible scheduling (e.g., Internet-based)';
comment on column source.y7_graduate_responses.q419 is 
  '4.19 - Credible, reliable patient satisfaction survey (to at least the practice level)';
comment on column source.y7_graduate_responses.q420 is 
  '4.20 - Sufficient and adequate physical space';
comment on column source.y7_graduate_responses.q421 is 
  '4.21 - Adequate, free parking';
comment on column source.y7_graduate_responses.q422 is 
  '4.22 - Convenient public transportation access';
comment on column source.y7_graduate_responses.q423 is 
  '4.23 - Using teams to manage patient care';
comment on column source.y7_graduate_responses.q424 is 
  '4.24 - Integrated behavioral health';
comment on column source.y7_graduate_responses.q425 is 
  '4.25 - Integrated ';
comment on column source.y7_graduate_responses.q426 is 
  '4.26 - Clinical pharmacy support';
comment on column source.y7_graduate_responses.q427 is 
  '4.27 - Group visits';
comment on column source.y7_graduate_responses.q428 is 
  '4.28 - Your practice as patient-centered versus physician-centered';
comment on column source.y7_graduate_responses.q429 is 
  '4.29 - Using the scale below, please indicate what role you have played in office practice redesign toward the Patient-Centered Medical Home.';
comment on column source.y7_graduate_responses.q430 is 
  '4.30 - Did you play a role during your residency training in Patient-Centered Medical Home design/implementation?';
comment on column source.y7_graduate_responses.q501a is 
  '5.02a - Adult inpatient care - Do you any of your family physician practice partners provide the following services?';
comment on column source.y7_graduate_responses.q501b is 
  '5.02b - Adult ICU / CCU care - Do you any of your family physician practice partners provide the following services?';
comment on column source.y7_graduate_responses.q501c is 
  '5.02c - Nursing home care - Do you any of your family physician practice partners provide the following services?';
comment on column source.y7_graduate_responses.q501d is 
  '5.02d - Newborn nursery care - Do you any of your family physician practice partners provide the following services?';
comment on column source.y7_graduate_responses.q501e is 
  '5.02e - Pediatric inpatient care - Do you any of your family physician practice partners provide the following services?';
comment on column source.y7_graduate_responses.q501f is 
  '5.02f - Surgical inpatient procedures - Do you any of your family physician practice partners provide the following services?';
comment on column source.y7_graduate_responses.q501g is 
  '5.02g - Emergency Room care - Do you any of your family physician practice partners provide the following services?';
comment on column source.y7_graduate_responses.q502 is 
  '5.02h - Prenatal care - Do you any of your family physician practice partners provide the following services?';
comment on column source.y7_graduate_responses.q503 is 
  '5.01 - Do you currently practice maternity care, including deliveries?';
comment on column source.y7_graduate_responses.q503_group is 
  '5.01c - Do other members of your practice group deliver babies?';
comment on column source.y7_graduate_responses.q503a is 
  '5.01a - Vaginal Deliveries';
comment on column source.y7_graduate_responses.q503b is 
  '5.01b - C-section deliveries - as primary surgeon';
comment on column source.y7_graduate_responses.q504 is 
  '5.03 - Have you experienced any difficulty getting hospital privileges?';
comment on column source.y7_graduate_responses.q504_describe is 
  '5.03a - Please describe the difficulties you''ve experienced:';
comment on column source.y7_graduate_responses.q505_1 is 
  'Medical students - 5.04 - What kind of teaching activities do you participate in?';
comment on column source.y7_graduate_responses.q505_2 is 
  'Residents - 5.04 - What kind of teaching activities do you participate in?';
comment on column source.y7_graduate_responses.q505_3 is 
  'Fellows - 5.04 - What kind of teaching activities do you participate in?';
comment on column source.y7_graduate_responses.q505_4 is 
  'Other health care professionals - 5.04 - What kind of teaching activities do you participate in?';
comment on column source.y7_graduate_responses.q505_other is 
  'Other health care professionals - Other Text - 5.04 - What kind of teaching activities do you participate in?';
comment on column source.y7_graduate_responses.q505_none is 
  'None of the above - 5.04 - What kind of teaching activities do you participate in?';
comment on column source.y7_graduate_responses.q506a is 
  '7.01a - Biopsies-punch, shave, excisional';
comment on column source.y7_graduate_responses.q506a_practiced is 
  'Currently part of your practice? - 7.01a - Biopsies-punch, shave, excisional';
comment on column source.y7_graduate_responses.q506b is 
  '7.01b - Cryosurgery';
comment on column source.y7_graduate_responses.q506b_practiced is 
  'Currently part of your practice? - 7.01b - Cryosurgery';
comment on column source.y7_graduate_responses.q506c is 
  '7.01c - Remove warts, toenail, foreign body';
comment on column source.y7_graduate_responses.q506c_practiced is 
  'Currently part of your practice? - 7.01c - Remove warts, toenail, foreign body';
comment on column source.y7_graduate_responses.q506d is 
  '7.01d - Incision & drainage of abscess';
comment on column source.y7_graduate_responses.q506d_practiced is 
  'Currently part of your practice? - 7.01d - Incision & drainage of abscess';
comment on column source.y7_graduate_responses.q506e is 
  '7.01e - Simple laceration repair';
comment on column source.y7_graduate_responses.q506e_practiced is 
  'Currently part of your practice? - 7.01e - Simple laceration repair';
comment on column source.y7_graduate_responses.q507a is 
  '7.02a - IUD insertion / removal';
comment on column source.y7_graduate_responses.q507a_practiced is 
  'Currently part of your practice? - 7.02a - IUD insertion / removal';
comment on column source.y7_graduate_responses.q507b is 
  '7.02b - Endometrial biopsy';
comment on column source.y7_graduate_responses.q507b_practiced is 
  'Currently part of your practice? - 7.02b - Endometrial biopsy';
comment on column source.y7_graduate_responses.q507c is 
  '7.02c - Remove cervical polyp';
comment on column source.y7_graduate_responses.q507c_practiced is 
  'Currently part of your practice? - 7.02c - Remove cervical polyp';
comment on column source.y7_graduate_responses.q507d is 
  '7.02d - Bartholin''s cyst management';
comment on column source.y7_graduate_responses.q507d_practiced is 
  'Currently part of your practice? - 7.02d - Bartholin''s cyst management';
comment on column source.y7_graduate_responses.q507e is 
  '7.02e - Colposcopy';
comment on column source.y7_graduate_responses.q507e_practiced is 
  'Currently part of your practice? - 7.02e - Colposcopy';
comment on column source.y7_graduate_responses.q507f is 
  '7.02f - Cervical cryotherapy';
comment on column source.y7_graduate_responses.q507f_practiced is 
  'Currently part of your practice? - 7.02f - Cervical cryotherapy';
comment on column source.y7_graduate_responses.q507g is 
  '7.02g - LEEP';
comment on column source.y7_graduate_responses.q507g_practiced is 
  'Currently part of your practice? - 7.02g - LEEP';
comment on column source.y7_graduate_responses.q507h is 
  '7.02h - Paracervical block';
comment on column source.y7_graduate_responses.q507h_practiced is 
  'Currently part of your practice? - 7.02h - Paracervical block';
comment on column source.y7_graduate_responses.q507i is 
  '7.02i - Uterine aspiration / dilation / evacuation';
comment on column source.y7_graduate_responses.q507i_practiced is 
  'Currently part of your practice? - 7.02i - Uterine aspiration / dilation / evacuation';
comment on column source.y7_graduate_responses.q507j is 
  '7.02j - Tubal ligation';
comment on column source.y7_graduate_responses.q507j_practiced is 
  'Currently part of your practice? - 7.02j - Tubal ligation';
comment on column source.y7_graduate_responses.q508a is 
  '7.03a - OB ultrasound';
comment on column source.y7_graduate_responses.q508a_practiced is 
  'Currently part of your practice? - 7.03a - OB ultrasound';
comment on column source.y7_graduate_responses.q508b is 
  '7.03b - Spontaneous vaginal delivery';
comment on column source.y7_graduate_responses.q508b_practiced is 
  'Currently part of your practice? - 7.03b - Spontaneous vaginal delivery';
comment on column source.y7_graduate_responses.q508c is 
  '7.03c - Labor induction / augmentation';
comment on column source.y7_graduate_responses.q508c_practiced is 
  'Currently part of your practice? - 7.03c - Labor induction / augmentation';
comment on column source.y7_graduate_responses.q508d is 
  '7.03d - Vacuum assisted delivery';
comment on column source.y7_graduate_responses.q508d_practiced is 
  'Currently part of your practice? - 7.03d - Vacuum assisted delivery';
comment on column source.y7_graduate_responses.q508e is 
  '7.03e - 3 rd & 4 th degree laceration repair';
comment on column source.y7_graduate_responses.q508e_practiced is 
  'Currently part of your practice? - 7.03e - 3rd & 4th degree laceration repair';
comment on column source.y7_graduate_responses.q508f is 
  '7.03f - C-section assist';
comment on column source.y7_graduate_responses.q508f_practiced is 
  'Currently part of your practice? - 7.03f - C-section assist';
comment on column source.y7_graduate_responses.q508g is 
  '7.03g - C-section primary surgeon';
comment on column source.y7_graduate_responses.q508g_practiced is 
  'Currently part of your practice? - 7.03g - C-section primary surgeon';
comment on column source.y7_graduate_responses.q509a is 
  '7.04a - Flexible sigmoidoscopy';
comment on column source.y7_graduate_responses.q509a_practiced is 
  'Currently part of your practice? - 7.04a - Flexible sigmoidoscopy';
comment on column source.y7_graduate_responses.q509b is 
  '7.04b - Colonoscopy';
comment on column source.y7_graduate_responses.q509b_practiced is 
  'Currently part of your practice? - 7.04b - Colonoscopy';
comment on column source.y7_graduate_responses.q509c is 
  '7.04c - Upper endoscopy';
comment on column source.y7_graduate_responses.q509c_practiced is 
  'Currently part of your practice? - 7.04c - Upper endoscopy';
comment on column source.y7_graduate_responses.q510a is 
  '7.05a - Anterior nasal packing for epistaxis';
comment on column source.y7_graduate_responses.q510a_practiced is 
  'Currently part of your practice? - 7.05a - Anterior nasal packing for epistaxis';
comment on column source.y7_graduate_responses.q510b is 
  '7.05b - Lumbar puncture';
comment on column source.y7_graduate_responses.q510b_practiced is 
  'Currently part of your practice? - 7.05b - Lumbar puncture';
comment on column source.y7_graduate_responses.q510c is 
  '7.05c - Thoracentesis';
comment on column source.y7_graduate_responses.q510c_practiced is 
  'Currently part of your practice? - 7.05c - Thoracentesis';
comment on column source.y7_graduate_responses.q510d is 
  '7.05d - Paracentesis';
comment on column source.y7_graduate_responses.q510d_practiced is 
  'Currently part of your practice? - 7.05d - Paracentesis';
comment on column source.y7_graduate_responses.q510e is 
  '7.05e - Central line';
comment on column source.y7_graduate_responses.q510e_practiced is 
  'Currently part of your practice? - 7.05e - Central line';
comment on column source.y7_graduate_responses.q510f is 
  '7.05f - Endotracheal intubation';
comment on column source.y7_graduate_responses.q510f_practiced is 
  'Currently part of your practice? - 7.05f - Endotracheal intubation';
comment on column source.y7_graduate_responses.q510g is 
  '7.05g - Ventilator management';
comment on column source.y7_graduate_responses.q510g_practiced is 
  'Currently part of your practice? - 7.05g - Ventilator management';
comment on column source.y7_graduate_responses.q510h is 
  '7.05h - Chest tube placement';
comment on column source.y7_graduate_responses.q510h_practiced is 
  'Currently part of your practice? - 7.05h - Chest tube placement';
comment on column source.y7_graduate_responses.q511a is 
  '7.06a - Initial management of simple FXs, including closed reduction';
comment on column source.y7_graduate_responses.q511a_practiced is 
  'Currently part of your practice? - 7.06a - Initial management of simple FXs, including closed reduction';
comment on column source.y7_graduate_responses.q511b is 
  '7.06b - Splinting & casting';
comment on column source.y7_graduate_responses.q511b_practiced is 
  'Currently part of your practice? - 7.06b - Splinting & casting';
comment on column source.y7_graduate_responses.q511c is 
  '7.06c - Injection/aspiration - joint, bursa, ganglion cyst, trigger point';
comment on column source.y7_graduate_responses.q511c_practiced is 
  'Currently part of your practice? - 7.06c - Injection/aspiration - joint, bursa, ganglion cyst, trigger point';
comment on column source.y7_graduate_responses.q512a is 
  '7.07a - Circumcision';
comment on column source.y7_graduate_responses.q512a_practiced is 
  'Currently part of your practice? - 7.07a - Circumcision';
comment on column source.y7_graduate_responses.q512b is 
  '7.07b - Vasectomy';
comment on column source.y7_graduate_responses.q512b_practiced is 
  'Currently part of your practice? - 7.07b - Vasectomy';
comment on column source.y7_graduate_responses.q513a is 
  '7.08a - Local Anesthesia / Field Block';
comment on column source.y7_graduate_responses.q513a_practiced is 
  'Currently part of your practice? - 7.08a - Local Anesthesia / Field Block';
comment on column source.y7_graduate_responses.q513b is 
  '7.08b - Peripheral nerve block';
comment on column source.y7_graduate_responses.q513b_practiced is 
  'Currently part of your practice? - 7.08b - Peripheral nerve block';
comment on column source.y7_graduate_responses.q513c is 
  '7.08c - Conscious sedation';
comment on column source.y7_graduate_responses.q513c_practiced is 
  'Currently part of your practice? - 7.08c - Conscious sedation';
comment on column source.y7_graduate_responses.q513d is 
  '7.08d - Exercise Treadmill Testing';
comment on column source.y7_graduate_responses.q513d_practiced is 
  'Currently part of your practice? - 7.08d - Exercise Treadmill Testing';
comment on column source.y7_graduate_responses.q513e is 
  '7.08e - Flexible nasopharyngoscopy';
comment on column source.y7_graduate_responses.q513e_practiced is 
  'Currently part of your practice? - 7.08e - Flexible nasopharyngoscopy';
comment on column source.y7_graduate_responses.q514a is 
  '6.06a - Assess community health needs';
comment on column source.y7_graduate_responses.q514a_practiced is 
  'Currently part of your practice? - 6.06a - Assess community health needs';
comment on column source.y7_graduate_responses.q514b is 
  '6.06b - Use community resources';
comment on column source.y7_graduate_responses.q514b_practiced is 
  'Currently part of your practice? - 6.06b - Use community resources';
comment on column source.y7_graduate_responses.q514c is 
  '6.06c - Develop community intervention';
comment on column source.y7_graduate_responses.q514c_practiced is 
  'Currently part of your practice? - 6.06c - Develop community intervention';
comment on column source.y7_graduate_responses.q514d is 
  '6.06d - Use of information technology';
comment on column source.y7_graduate_responses.q514d_practiced is 
  'Currently part of your practice? - 6.06d - Use of information technology';
comment on column source.y7_graduate_responses.q514e is 
  '6.06e - Quality improvement';
comment on column source.y7_graduate_responses.q514e_practiced is 
  'Currently part of your practice? - 6.06e - Quality improvement';
comment on column source.y7_graduate_responses.q514f is 
  '6.06f - Team-based care';
comment on column source.y7_graduate_responses.q514f_practiced is 
  'Currently part of your practice? - 6.06f - Team-based care';
comment on column source.y7_graduate_responses.q514g is 
  '6.06g - Integration of evidence-based medicine';
comment on column source.y7_graduate_responses.q514g_practiced is 
  'Currently part of your practice? - 6.06g - Integration of evidence-based medicine';
comment on column source.y7_graduate_responses.q514h is 
  '6.06h - Health behavior change counseling';
comment on column source.y7_graduate_responses.q514h_practiced is 
  'Currently part of your practice? - 6.06h - Health behavior change counseling';
comment on column source.y7_graduate_responses.q514i is 
  '6.06i - Pain Management';
comment on column source.y7_graduate_responses.q514i_practiced is 
  'Currently part of your practice? - 6.06i - Pain Management';
comment on column source.y7_graduate_responses.q514j is 
  '6.06j - Alcohol / Substance Abuse';
comment on column source.y7_graduate_responses.q514j_practiced is 
  'Currently part of your practice? - 6.06j - Alcohol / Substance Abuse';
comment on column source.y7_graduate_responses.q601a is 
  '6.01a - Prenatal care';
comment on column source.y7_graduate_responses.q601a_practiced is 
  'Currently part of your practice? - 6.01a - Prenatal care';
comment on column source.y7_graduate_responses.q601b is 
  '6.01b - Labor Management';
comment on column source.y7_graduate_responses.q601b_practiced is 
  'Currently part of your practice? - 6.01b - Labor Management';
comment on column source.y7_graduate_responses.q601c is 
  '6.01c - Vaginal Deliveries';
comment on column source.y7_graduate_responses.q601c_practiced is 
  'Currently part of your practice? - 6.01c - Vaginal Deliveries';
comment on column source.y7_graduate_responses.q601d is 
  '6.01d - Post-partum care';
comment on column source.y7_graduate_responses.q601d_practiced is 
  'Currently part of your practice? - 6.01d - Post-partum care';
comment on column source.y7_graduate_responses.q601e is 
  '6.01e - Cesarean Section Assist';
comment on column source.y7_graduate_responses.q601e_practiced is 
  'Currently part of your practice? - 6.01e - Cesarean Section Assist';
comment on column source.y7_graduate_responses.q602a is 
  '6.02a - Ambulatory care';
comment on column source.y7_graduate_responses.q602a_practiced is 
  'Currently part of your practice? - 6.02a - Ambulatory care';
comment on column source.y7_graduate_responses.q602b is 
  '6.02b - Newborn resuscitation';
comment on column source.y7_graduate_responses.q602b_practiced is 
  'Currently part of your practice? - 6.02b - Newborn resuscitation';
comment on column source.y7_graduate_responses.q602c is 
  '6.02c - Newborn care in hospital';
comment on column source.y7_graduate_responses.q602c_practiced is 
  'Currently part of your practice? - 6.02c - Newborn care in hospital';
comment on column source.y7_graduate_responses.q602d is 
  '6.02d - Other hospital care';
comment on column source.y7_graduate_responses.q602d_practiced is 
  'Currently part of your practice? - 6.02d - Other hospital care';
comment on column source.y7_graduate_responses.q602e is 
  '6.02e - Teen care';
comment on column source.y7_graduate_responses.q602e_practiced is 
  'Currently part of your practice? - 6.02e - Teen care';
comment on column source.y7_graduate_responses.q603a is 
  '6.03a - Ambulatory care';
comment on column source.y7_graduate_responses.q603a_practiced is 
  'Currently part of your practice? - 6.03a - Ambulatory care';
comment on column source.y7_graduate_responses.q603b is 
  '6.03b - Inpatient care';
comment on column source.y7_graduate_responses.q603b_practiced is 
  'Currently part of your practice? - 6.03b - Inpatient care';
comment on column source.y7_graduate_responses.q603c is 
  '6.03c - Intensive care / ICU-CCU';
comment on column source.y7_graduate_responses.q603c_practiced is 
  'Currently part of your practice? - 6.03c - Intensive care / ICU-CCU';
comment on column source.y7_graduate_responses.q603d is 
  '6.03d - Nursing home care';
comment on column source.y7_graduate_responses.q603d_practiced is 
  'Currently part of your practice? - 6.03d - Nursing home care';
comment on column source.y7_graduate_responses.q603e is 
  '6.03e - Surgical assist';
comment on column source.y7_graduate_responses.q603e_practiced is 
  'Currently part of your practice? - 6.03e - Surgical assist';
comment on column source.y7_graduate_responses.q603f is 
  '6.03f - EKG interpretation';
comment on column source.y7_graduate_responses.q603f_practiced is 
  'Currently part of your practice? - 6.03f - EKG interpretation';
comment on column source.y7_graduate_responses.q604a is 
  '6.04a - Pre-Op and Post-Op Care';
comment on column source.y7_graduate_responses.q604a_practiced is 
  'Currently part of your practice? - 6.04a - Pre-Op and Post-Op Care';
comment on column source.y7_graduate_responses.q604b is 
  '6.04b - Ophthalmology';
comment on column source.y7_graduate_responses.q604b_practiced is 
  'Currently part of your practice? - 6.04b - Ophthalmology';
comment on column source.y7_graduate_responses.q604c is 
  '6.04c - Otolaryngology';
comment on column source.y7_graduate_responses.q604c_practiced is 
  'Currently part of your practice? - 6.04c - Otolaryngology';
comment on column source.y7_graduate_responses.q604d is 
  '6.04d - Urology';
comment on column source.y7_graduate_responses.q604d_practiced is 
  'Currently part of your practice? - 6.04d - Urology';
comment on column source.y7_graduate_responses.q605a is 
  '6.05a - Major Psychiatric Disorders / Psychiatry';
comment on column source.y7_graduate_responses.q605a_practiced is 
  'Currently part of your practice? - 6.05a - Major Psychiatric Disorders / Psychiatry';
comment on column source.y7_graduate_responses.q605b is 
  '6.05b - Counseling Individual / Family';
comment on column source.y7_graduate_responses.q605b_practiced is 
  'Currently part of your practice? - 6.05b - Counseling Individual / Family';
comment on column source.y7_graduate_responses.q606a is 
  '6.07a - Women''s Health';
comment on column source.y7_graduate_responses.q606a_practiced is 
  'Currently part of your practice? - 6.07a - Women''s Health';
comment on column source.y7_graduate_responses.q606b is 
  '6.07b - Gynecology';
comment on column source.y7_graduate_responses.q606b_practiced is 
  'Currently part of your practice? - 6.07b - Gynecology';
comment on column source.y7_graduate_responses.q606c is 
  '6.07c - Orthopedics / Musculoskeletal Medicine';
comment on column source.y7_graduate_responses.q606c_practiced is 
  'Currently part of your practice? - 6.07c - Orthopedics / Musculoskeletal Medicine';
comment on column source.y7_graduate_responses.q606d is 
  '6.07d - Sports Medicine';
comment on column source.y7_graduate_responses.q606d_practiced is 
  'Currently part of your practice? - 6.07d - Sports Medicine';
comment on column source.y7_graduate_responses.q606e is 
  '6.07e - Emergency Medicine';
comment on column source.y7_graduate_responses.q606e_practiced is 
  'Currently part of your practice? - 6.07e - Emergency Medicine';
comment on column source.y7_graduate_responses.q606f is 
  '6.07f - Dermatology';
comment on column source.y7_graduate_responses.q606f_practiced is 
  'Currently part of your practice? - 6.07f - Dermatology';
comment on column source.y7_graduate_responses.q606g is 
  '6.07g - Diagnostic Imaging';
comment on column source.y7_graduate_responses.q606g_practiced is 
  'Currently part of your practice? - 6.07g - Diagnostic Imaging';
comment on column source.y7_graduate_responses.q606h is 
  '6.07h - Geriatrics';
comment on column source.y7_graduate_responses.q606h_practiced is 
  'Currently part of your practice? - 6.07h - Geriatrics';
comment on column source.y7_graduate_responses.q606i is 
  '6.07i - End of Life Care';
comment on column source.y7_graduate_responses.q606i_practiced is 
  'Currently part of your practice? - 6.07i - End of Life Care';
comment on column source.y7_graduate_responses.q701 is 
  'Do you have any additional comments to add?';

