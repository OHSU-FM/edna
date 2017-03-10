
--
-- P4 Residency Survey - Y1 Reporting Database
-- Oregon Health & Science University, Department of Family Medicine
--
-- Converted using editor macros from:
--    Y1 Residency Program Variables Clean 12.12.08.xls
--    Y1 Residency Program Variables Codebook.xls
--    All Y1 Continuity Clinic Variables Clean 12.12.08.xls
--    Y1 Continuity Clinic Variables Codebook.xls
--    Y1 Resident Survey Clean 12.12.08.xls
--    Y1 Resident Survey Codebook.xls
--
-- Technical Contact:
--    David Brown, browndav@ohsu.edu (12/2008 - 04/2011)
--    William Hatt, hattb@ohsu.edu (9/2011 - Current)

begin transaction;

-- Remove Baylor K-S Control from Database:
--  This is by request of Pat Eiff and Patty Carney on 1/20/2009
--  N.B. - ABFMID 1204812682 fully identifies P4ResidencyID AC1.
/*
delete from source.y1_residency_programs where id = '1204812682';
delete from source.y1_resident_responses where id = '1204812682';
delete from source.y1_continuity_clinics where p4_program_id = 'AC1';
-- Altered dataset to delete these -- check SVN and data migration log for details
*/

-- Compute reporting statistics

select transform.append_meta_attribute_statistics(
  'source', 'y5_resident_responses', 'p4_program_id', 'A14'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_resident_responses', 'p4_program_id', 'B13'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_resident_responses', 'p4_program_id', 'C12'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_resident_responses', 'p4_program_id', 'D11'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_resident_responses', 'p4_program_id', 'E10'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_resident_responses', 'p4_program_id', 'F09'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_resident_responses', 'p4_program_id', 'G08'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_resident_responses', 'p4_program_id', 'H07'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_resident_responses', 'p4_program_id', 'I06'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_resident_responses', 'p4_program_id', 'J05'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_resident_responses', 'p4_program_id', 'K04'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_resident_responses', 'p4_program_id', 'L03'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_resident_responses', 'p4_program_id', 'M02'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_resident_responses', 'p4_program_id', 'N01'
);


select transform.append_meta_attribute_statistics(
  'source', 'y4_resident_responses', 'p4_program_id', 'A14'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_resident_responses', 'p4_program_id', 'B13'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_resident_responses', 'p4_program_id', 'C12'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_resident_responses', 'p4_program_id', 'D11'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_resident_responses', 'p4_program_id', 'E10'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_resident_responses', 'p4_program_id', 'F09'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_resident_responses', 'p4_program_id', 'G08'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_resident_responses', 'p4_program_id', 'H07'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_resident_responses', 'p4_program_id', 'I06'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_resident_responses', 'p4_program_id', 'J05'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_resident_responses', 'p4_program_id', 'K04'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_resident_responses', 'p4_program_id', 'L03'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_resident_responses', 'p4_program_id', 'M02'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_resident_responses', 'p4_program_id', 'N01'
);


select transform.append_meta_attribute_statistics(
  'source', 'y1_webads_responses', 'p4_program_id', 'A14'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_webads_responses', 'p4_program_id', 'B13'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_webads_responses', 'p4_program_id', 'C12'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_webads_responses', 'p4_program_id', 'D11'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_webads_responses', 'p4_program_id', 'E10'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_webads_responses', 'p4_program_id', 'F09'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_webads_responses', 'p4_program_id', 'G08'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_webads_responses', 'p4_program_id', 'H07'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_webads_responses', 'p4_program_id', 'I06'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_webads_responses', 'p4_program_id', 'J05'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_webads_responses', 'p4_program_id', 'K04'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_webads_responses', 'p4_program_id', 'L03'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_webads_responses', 'p4_program_id', 'M02'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_webads_responses', 'p4_program_id', 'N01'
);


select transform.append_meta_attribute_statistics(
  'source', 'y2_webads_responses', 'p4_program_id', 'A14'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_webads_responses', 'p4_program_id', 'B13'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_webads_responses', 'p4_program_id', 'C12'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_webads_responses', 'p4_program_id', 'D11'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_webads_responses', 'p4_program_id', 'E10'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_webads_responses', 'p4_program_id', 'F09'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_webads_responses', 'p4_program_id', 'G08'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_webads_responses', 'p4_program_id', 'H07'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_webads_responses', 'p4_program_id', 'I06'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_webads_responses', 'p4_program_id', 'J05'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_webads_responses', 'p4_program_id', 'K04'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_webads_responses', 'p4_program_id', 'L03'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_webads_responses', 'p4_program_id', 'M02'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_webads_responses', 'p4_program_id', 'N01'
);


select transform.append_meta_attribute_statistics(
  'source', 'y1_continuity_clinics', 'p4_program_id', 'A14'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_continuity_clinics', 'p4_program_id', 'B13'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_continuity_clinics', 'p4_program_id', 'C12'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_continuity_clinics', 'p4_program_id', 'D11'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_continuity_clinics', 'p4_program_id', 'E10'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_continuity_clinics', 'p4_program_id', 'F09'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_continuity_clinics', 'p4_program_id', 'G08'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_continuity_clinics', 'p4_program_id', 'H07'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_continuity_clinics', 'p4_program_id', 'I06'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_continuity_clinics', 'p4_program_id', 'J05'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_continuity_clinics', 'p4_program_id', 'K04'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_continuity_clinics', 'p4_program_id', 'L03'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_continuity_clinics', 'p4_program_id', 'M02'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_continuity_clinics', 'p4_program_id', 'N01'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_residency_programs', 'p4_program_id', 'A14'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_residency_programs', 'p4_program_id', 'B13'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_residency_programs', 'p4_program_id', 'C12'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_residency_programs', 'p4_program_id', 'D11'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_residency_programs', 'p4_program_id', 'E10'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_residency_programs', 'p4_program_id', 'F09'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_residency_programs', 'p4_program_id', 'G08'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_residency_programs', 'p4_program_id', 'H07'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_residency_programs', 'p4_program_id', 'I06'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_residency_programs', 'p4_program_id', 'J05'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_residency_programs', 'p4_program_id', 'K04'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_residency_programs', 'p4_program_id', 'L03'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_residency_programs', 'p4_program_id', 'M02'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_residency_programs', 'p4_program_id', 'N01'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_resident_responses', 'p4_program_id', 'A14'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_resident_responses', 'p4_program_id', 'B13'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_resident_responses', 'p4_program_id', 'C12'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_resident_responses', 'p4_program_id', 'D11'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_resident_responses', 'p4_program_id', 'E10'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_resident_responses', 'p4_program_id', 'F09'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_resident_responses', 'p4_program_id', 'G08'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_resident_responses', 'p4_program_id', 'H07'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_resident_responses', 'p4_program_id', 'I06'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_resident_responses', 'p4_program_id', 'J05'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_resident_responses', 'p4_program_id', 'K04'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_resident_responses', 'p4_program_id', 'L03'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_resident_responses', 'p4_program_id', 'M02'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_resident_responses', 'p4_program_id', 'N01'
);


select transform.append_meta_attribute_statistics(
  'source', 'y1_graduate_responses', 'p4_program_id', 'A14'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_graduate_responses', 'p4_program_id', 'B13'
);
-- None of these graduates completed a survey for this year
-- select transform.append_meta_attribute_statistics(
--   'source', 'y1_graduate_responses', 'p4_program_id', 'C12'
-- );
select transform.append_meta_attribute_statistics(
  'source', 'y1_graduate_responses', 'p4_program_id', 'D11'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_graduate_responses', 'p4_program_id', 'E10'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_graduate_responses', 'p4_program_id', 'F09'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_graduate_responses', 'p4_program_id', 'G08'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_graduate_responses', 'p4_program_id', 'H07'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_graduate_responses', 'p4_program_id', 'I06'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_graduate_responses', 'p4_program_id', 'J05'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_graduate_responses', 'p4_program_id', 'K04'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_graduate_responses', 'p4_program_id', 'L03'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_graduate_responses', 'p4_program_id', 'M02'
);
select transform.append_meta_attribute_statistics(
  'source', 'y1_graduate_responses', 'p4_program_id', 'N01'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_graduate_responses', 'p4_program_id', 'A14'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_graduate_responses', 'p4_program_id', 'B13'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_graduate_responses', 'p4_program_id', 'C12'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_graduate_responses', 'p4_program_id', 'D11'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_graduate_responses', 'p4_program_id', 'E10'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_graduate_responses', 'p4_program_id', 'F09'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_graduate_responses', 'p4_program_id', 'G08'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_graduate_responses', 'p4_program_id', 'H07'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_graduate_responses', 'p4_program_id', 'I06'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_graduate_responses', 'p4_program_id', 'J05'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_graduate_responses', 'p4_program_id', 'K04'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_graduate_responses', 'p4_program_id', 'L03'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_graduate_responses', 'p4_program_id', 'M02'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_graduate_responses', 'p4_program_id', 'N01'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_graduate_responses', 'p4_program_id', 'A14'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_graduate_responses', 'p4_program_id', 'B13'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_graduate_responses', 'p4_program_id', 'C12'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_graduate_responses', 'p4_program_id', 'D11'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_graduate_responses', 'p4_program_id', 'E10'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_graduate_responses', 'p4_program_id', 'F09'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_graduate_responses', 'p4_program_id', 'G08'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_graduate_responses', 'p4_program_id', 'H07'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_graduate_responses', 'p4_program_id', 'I06'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_graduate_responses', 'p4_program_id', 'J05'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_graduate_responses', 'p4_program_id', 'K04'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_graduate_responses', 'p4_program_id', 'L03'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_graduate_responses', 'p4_program_id', 'M02'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_graduate_responses', 'p4_program_id', 'N01'
);

-- Add program data for y4_grad_survey to stats table
select transform.append_meta_attribute_statistics(
  'source', 'y4_graduate_responses', 'p4_program_id', 'A14'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_graduate_responses', 'p4_program_id', 'B13'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_graduate_responses', 'p4_program_id', 'C12'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_graduate_responses', 'p4_program_id', 'D11'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_graduate_responses', 'p4_program_id', 'E10'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_graduate_responses', 'p4_program_id', 'F09'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_graduate_responses', 'p4_program_id', 'G08'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_graduate_responses', 'p4_program_id', 'H07'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_graduate_responses', 'p4_program_id', 'I06'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_graduate_responses', 'p4_program_id', 'J05'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_graduate_responses', 'p4_program_id', 'K04'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_graduate_responses', 'p4_program_id', 'L03'
);
select transform.append_meta_attribute_statistics(
   'source', 'y4_graduate_responses', 'p4_program_id', 'M02'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_graduate_responses', 'p4_program_id', 'N01'
);

-- Add program data for y5_grad_survey to stats table
select transform.append_meta_attribute_statistics(
  'source', 'y5_graduate_responses', 'p4_program_id', 'A14'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_graduate_responses', 'p4_program_id', 'B13'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_graduate_responses', 'p4_program_id', 'C12'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_graduate_responses', 'p4_program_id', 'D11'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_graduate_responses', 'p4_program_id', 'E10'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_graduate_responses', 'p4_program_id', 'F09'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_graduate_responses', 'p4_program_id', 'G08'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_graduate_responses', 'p4_program_id', 'H07'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_graduate_responses', 'p4_program_id', 'I06'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_graduate_responses', 'p4_program_id', 'J05'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_graduate_responses', 'p4_program_id', 'K04'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_graduate_responses', 'p4_program_id', 'L03'
);
select transform.append_meta_attribute_statistics(
   'source', 'y5_graduate_responses', 'p4_program_id', 'M02'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_graduate_responses', 'p4_program_id', 'N01'
);

-- Add program data for y6_grad_survey to stats table
select transform.append_meta_attribute_statistics(
  'source', 'y6_graduate_responses', 'p4_program_id', 'A14'
);
select transform.append_meta_attribute_statistics(
  'source', 'y6_graduate_responses', 'p4_program_id', 'B13'
);
select transform.append_meta_attribute_statistics(
  'source', 'y6_graduate_responses', 'p4_program_id', 'C12'
);
select transform.append_meta_attribute_statistics(
  'source', 'y6_graduate_responses', 'p4_program_id', 'D11'
);
select transform.append_meta_attribute_statistics(
  'source', 'y6_graduate_responses', 'p4_program_id', 'E10'
);
select transform.append_meta_attribute_statistics(
  'source', 'y6_graduate_responses', 'p4_program_id', 'F09'
);
select transform.append_meta_attribute_statistics(
  'source', 'y6_graduate_responses', 'p4_program_id', 'G08'
);
select transform.append_meta_attribute_statistics(
  'source', 'y6_graduate_responses', 'p4_program_id', 'H07'
);
select transform.append_meta_attribute_statistics(
  'source', 'y6_graduate_responses', 'p4_program_id', 'I06'
);
select transform.append_meta_attribute_statistics(
  'source', 'y6_graduate_responses', 'p4_program_id', 'J05'
);
select transform.append_meta_attribute_statistics(
  'source', 'y6_graduate_responses', 'p4_program_id', 'K04'
);
select transform.append_meta_attribute_statistics(
  'source', 'y6_graduate_responses', 'p4_program_id', 'L03'
);
select transform.append_meta_attribute_statistics(
   'source', 'y6_graduate_responses', 'p4_program_id', 'M02'
);
select transform.append_meta_attribute_statistics(
  'source', 'y6_graduate_responses', 'p4_program_id', 'N01'
);

-- Add program data for y7_grad_survey to stats table
select transform.append_meta_attribute_statistics(
  'source', 'y7_graduate_responses', 'p4_program_id', 'A14'
);
select transform.append_meta_attribute_statistics(
  'source', 'y7_graduate_responses', 'p4_program_id', 'B13'
);
select transform.append_meta_attribute_statistics(
  'source', 'y7_graduate_responses', 'p4_program_id', 'C12'
);
select transform.append_meta_attribute_statistics(
  'source', 'y7_graduate_responses', 'p4_program_id', 'D11'
);
select transform.append_meta_attribute_statistics(
  'source', 'y7_graduate_responses', 'p4_program_id', 'E10'
);
select transform.append_meta_attribute_statistics(
  'source', 'y7_graduate_responses', 'p4_program_id', 'F09'
);
select transform.append_meta_attribute_statistics(
  'source', 'y7_graduate_responses', 'p4_program_id', 'G08'
);
select transform.append_meta_attribute_statistics(
  'source', 'y7_graduate_responses', 'p4_program_id', 'H07'
);
select transform.append_meta_attribute_statistics(
  'source', 'y7_graduate_responses', 'p4_program_id', 'I06'
);
select transform.append_meta_attribute_statistics(
  'source', 'y7_graduate_responses', 'p4_program_id', 'J05'
);
select transform.append_meta_attribute_statistics(
  'source', 'y7_graduate_responses', 'p4_program_id', 'K04'
);
select transform.append_meta_attribute_statistics(
  'source', 'y7_graduate_responses', 'p4_program_id', 'L03'
);
select transform.append_meta_attribute_statistics(
   'source', 'y7_graduate_responses', 'p4_program_id', 'M02'
);
select transform.append_meta_attribute_statistics(
  'source', 'y7_graduate_responses', 'p4_program_id', 'N01'
);


select transform.append_meta_attribute_statistics(
  'source', 'y2_continuity_clinics', 'p4_program_id', 'A14'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_continuity_clinics', 'p4_program_id', 'B13'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_continuity_clinics', 'p4_program_id', 'C12'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_continuity_clinics', 'p4_program_id', 'D11'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_continuity_clinics', 'p4_program_id', 'E10'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_continuity_clinics', 'p4_program_id', 'F09'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_continuity_clinics', 'p4_program_id', 'G08'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_continuity_clinics', 'p4_program_id', 'H07'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_continuity_clinics', 'p4_program_id', 'I06'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_continuity_clinics', 'p4_program_id', 'J05'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_continuity_clinics', 'p4_program_id', 'K04'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_continuity_clinics', 'p4_program_id', 'L03'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_continuity_clinics', 'p4_program_id', 'M02'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_continuity_clinics', 'p4_program_id', 'N01'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_residency_programs', 'p4_program_id', 'A14'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_residency_programs', 'p4_program_id', 'B13'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_residency_programs', 'p4_program_id', 'C12'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_residency_programs', 'p4_program_id', 'D11'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_residency_programs', 'p4_program_id', 'E10'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_residency_programs', 'p4_program_id', 'F09'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_residency_programs', 'p4_program_id', 'G08'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_residency_programs', 'p4_program_id', 'H07'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_residency_programs', 'p4_program_id', 'I06'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_residency_programs', 'p4_program_id', 'J05'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_residency_programs', 'p4_program_id', 'K04'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_residency_programs', 'p4_program_id', 'L03'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_residency_programs', 'p4_program_id', 'M02'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_residency_programs', 'p4_program_id', 'N01'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_resident_responses', 'p4_program_id', 'A14'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_resident_responses', 'p4_program_id', 'B13'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_resident_responses', 'p4_program_id', 'C12'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_resident_responses', 'p4_program_id', 'D11'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_resident_responses', 'p4_program_id', 'E10'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_resident_responses', 'p4_program_id', 'F09'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_resident_responses', 'p4_program_id', 'G08'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_resident_responses', 'p4_program_id', 'H07'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_resident_responses', 'p4_program_id', 'I06'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_resident_responses', 'p4_program_id', 'J05'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_resident_responses', 'p4_program_id', 'K04'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_resident_responses', 'p4_program_id', 'L03'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_resident_responses', 'p4_program_id', 'M02'
);
select transform.append_meta_attribute_statistics(
  'source', 'y2_resident_responses', 'p4_program_id', 'N01'
);

select transform.append_meta_attribute_statistics(
  'source', 'y3_residency_programs', 'p4_program_id', 'A14'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_residency_programs', 'p4_program_id', 'B13'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_residency_programs', 'p4_program_id', 'C12'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_residency_programs', 'p4_program_id', 'D11'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_residency_programs', 'p4_program_id', 'E10'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_residency_programs', 'p4_program_id', 'F09'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_residency_programs', 'p4_program_id', 'G08'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_residency_programs', 'p4_program_id', 'H07'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_residency_programs', 'p4_program_id', 'I06'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_residency_programs', 'p4_program_id', 'J05'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_residency_programs', 'p4_program_id', 'K04'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_residency_programs', 'p4_program_id', 'L03'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_residency_programs', 'p4_program_id', 'M02'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_residency_programs', 'p4_program_id', 'N01'
);

select transform.append_meta_attribute_statistics(
  'source', 'y3_continuity_clinics', 'p4_program_id', 'A14'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_continuity_clinics', 'p4_program_id', 'B13'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_continuity_clinics', 'p4_program_id', 'C12'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_continuity_clinics', 'p4_program_id', 'D11'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_continuity_clinics', 'p4_program_id', 'E10'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_continuity_clinics', 'p4_program_id', 'F09'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_continuity_clinics', 'p4_program_id', 'G08'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_continuity_clinics', 'p4_program_id', 'H07'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_continuity_clinics', 'p4_program_id', 'I06'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_continuity_clinics', 'p4_program_id', 'J05'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_continuity_clinics', 'p4_program_id', 'K04'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_continuity_clinics', 'p4_program_id', 'L03'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_continuity_clinics', 'p4_program_id', 'M02'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_resident_responses', 'p4_program_id', 'A14'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_resident_responses', 'p4_program_id', 'B13'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_resident_responses', 'p4_program_id', 'C12'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_resident_responses', 'p4_program_id', 'D11'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_resident_responses', 'p4_program_id', 'E10'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_resident_responses', 'p4_program_id', 'F09'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_resident_responses', 'p4_program_id', 'G08'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_resident_responses', 'p4_program_id', 'H07'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_resident_responses', 'p4_program_id', 'I06'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_resident_responses', 'p4_program_id', 'J05'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_resident_responses', 'p4_program_id', 'K04'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_resident_responses', 'p4_program_id', 'L03'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_resident_responses', 'p4_program_id', 'M02'
);
select transform.append_meta_attribute_statistics(
  'source', 'y3_resident_responses', 'p4_program_id', 'N01'
);


select transform.append_meta_attribute_statistics(
  'source', 'y4_residency_programs', 'p4_program_id', 'A14'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_residency_programs', 'p4_program_id', 'B13'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_residency_programs', 'p4_program_id', 'C12'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_residency_programs', 'p4_program_id', 'D11'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_residency_programs', 'p4_program_id', 'E10'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_residency_programs', 'p4_program_id', 'F09'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_residency_programs', 'p4_program_id', 'G08'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_residency_programs', 'p4_program_id', 'H07'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_residency_programs', 'p4_program_id', 'I06'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_residency_programs', 'p4_program_id', 'J05'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_residency_programs', 'p4_program_id', 'K04'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_residency_programs', 'p4_program_id', 'L03'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_residency_programs', 'p4_program_id', 'M02'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_residency_programs', 'p4_program_id', 'N01'
);

select transform.append_meta_attribute_statistics(
  'source', 'y5_residency_programs', 'p4_program_id', 'A14'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_residency_programs', 'p4_program_id', 'B13'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_residency_programs', 'p4_program_id', 'C12'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_residency_programs', 'p4_program_id', 'D11'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_residency_programs', 'p4_program_id', 'E10'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_residency_programs', 'p4_program_id', 'F09'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_residency_programs', 'p4_program_id', 'G08'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_residency_programs', 'p4_program_id', 'H07'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_residency_programs', 'p4_program_id', 'I06'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_residency_programs', 'p4_program_id', 'J05'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_residency_programs', 'p4_program_id', 'K04'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_residency_programs', 'p4_program_id', 'L03'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_residency_programs', 'p4_program_id', 'M02'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_residency_programs', 'p4_program_id', 'N01'
);


select transform.append_meta_attribute_statistics(
  'source', 'y5_continuity_clinics', 'p4_program_id', 'A14'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_continuity_clinics', 'p4_program_id', 'B13'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_continuity_clinics', 'p4_program_id', 'C12'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_continuity_clinics', 'p4_program_id', 'D11'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_continuity_clinics', 'p4_program_id', 'E10'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_continuity_clinics', 'p4_program_id', 'F09'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_continuity_clinics', 'p4_program_id', 'G08'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_continuity_clinics', 'p4_program_id', 'H07'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_continuity_clinics', 'p4_program_id', 'I06'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_continuity_clinics', 'p4_program_id', 'J05'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_continuity_clinics', 'p4_program_id', 'K04'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_continuity_clinics', 'p4_program_id', 'L03'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_continuity_clinics', 'p4_program_id', 'M02'
);
select transform.append_meta_attribute_statistics(
  'source', 'y5_continuity_clinics', 'p4_program_id', 'N01'
);


select transform.append_meta_attribute_statistics(
  'source', 'y4_continuity_clinics', 'p4_program_id', 'A14'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_continuity_clinics', 'p4_program_id', 'B13'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_continuity_clinics', 'p4_program_id', 'C12'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_continuity_clinics', 'p4_program_id', 'D11'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_continuity_clinics', 'p4_program_id', 'E10'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_continuity_clinics', 'p4_program_id', 'F09'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_continuity_clinics', 'p4_program_id', 'G08'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_continuity_clinics', 'p4_program_id', 'H07'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_continuity_clinics', 'p4_program_id', 'I06'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_continuity_clinics', 'p4_program_id', 'J05'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_continuity_clinics', 'p4_program_id', 'K04'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_continuity_clinics', 'p4_program_id', 'L03'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_continuity_clinics', 'p4_program_id', 'M02'
);
select transform.append_meta_attribute_statistics(
  'source', 'y4_continuity_clinics', 'p4_program_id', 'N01'
);



select transform.append_meta_attribute_values(
  'p4_program_id', 'A14'
);
select transform.append_meta_attribute_values(
  'p4_program_id', 'B13'
);
select transform.append_meta_attribute_values(
  'p4_program_id', 'C12'
);
select transform.append_meta_attribute_values(
  'p4_program_id', 'D11'
);
select transform.append_meta_attribute_values(
  'p4_program_id', 'E10'
);
select transform.append_meta_attribute_values(
  'p4_program_id', 'F09'
);
select transform.append_meta_attribute_values(
  'p4_program_id', 'G08'
);
select transform.append_meta_attribute_values(
  'p4_program_id', 'H07'
);
select transform.append_meta_attribute_values(
  'p4_program_id', 'I06'
);
select transform.append_meta_attribute_values(
  'p4_program_id', 'J05'
);
select transform.append_meta_attribute_values(
  'p4_program_id', 'K04'
);
select transform.append_meta_attribute_values(
  'p4_program_id', 'L03'
);
select transform.append_meta_attribute_values(
  'p4_program_id', 'M02'
);
select transform.append_meta_attribute_values(
  'p4_program_id', 'N01'
);



-- Recode Site Identifiers to opaque single-character strings:
--    Order is pre-generated and pseudo-random. Data required to
--    reverse the blinding is *not* stored anywhere in the database.

update target.meta_attribute_statistics set subset_id = 'A' where subset_id = 'C12';
update target.meta_attribute_values set subset_id = 'A' where subset_id = 'C12';
update target.meta_attribute_statistics set subset_id = 'B' where subset_id = 'L03';
update target.meta_attribute_values set subset_id = 'B' where subset_id = 'L03';
update target.meta_attribute_statistics set subset_id = 'C' where subset_id = 'I06';
update target.meta_attribute_values set subset_id = 'C' where subset_id = 'I06';
update target.meta_attribute_statistics set subset_id = 'D' where subset_id = 'F09';
update target.meta_attribute_values set subset_id = 'D' where subset_id = 'F09';
update target.meta_attribute_statistics set subset_id = 'E' where subset_id = 'A14';
update target.meta_attribute_values set subset_id = 'E' where subset_id = 'A14';
update target.meta_attribute_statistics set subset_id = 'F' where subset_id = 'D11';
update target.meta_attribute_values set subset_id = 'F' where subset_id = 'D11';
update target.meta_attribute_statistics set subset_id = 'G' where subset_id = 'M02';
update target.meta_attribute_values set subset_id = 'G' where subset_id = 'M02';
update target.meta_attribute_statistics set subset_id = 'H' where subset_id = 'B13';
update target.meta_attribute_values set subset_id = 'H' where subset_id = 'B13';
update target.meta_attribute_statistics set subset_id = 'I' where subset_id = 'H07';
update target.meta_attribute_values set subset_id = 'I' where subset_id = 'H07';
update target.meta_attribute_statistics set subset_id = 'J' where subset_id = 'G08';
update target.meta_attribute_values set subset_id = 'J' where subset_id = 'G08';
update target.meta_attribute_statistics set subset_id = 'K' where subset_id = 'N01';
update target.meta_attribute_values set subset_id = 'K' where subset_id = 'N01';
update target.meta_attribute_statistics set subset_id = 'L' where subset_id = 'J05';
update target.meta_attribute_values set subset_id = 'L' where subset_id = 'J05';
update target.meta_attribute_statistics set subset_id = 'M' where subset_id = 'E10';
update target.meta_attribute_values set subset_id = 'M' where subset_id = 'E10';
update target.meta_attribute_statistics set subset_id = 'N' where subset_id = 'K04';
update target.meta_attribute_values set subset_id = 'N' where subset_id = 'K04';



-- Continuous Attributes:
--    For certain attributes, set is_continuous to true to enable
--    the generation of means, CIs, and continuous histogram displays.

update
  target.meta_attribute_statistics
set
  is_continuous = true
where
(
  (entity_name = 'y1_resident_responses' and attribute_name in (
    'age', 'many', 'yearsbeforemedschool', 'activitiesclinrot',
    'activitieslectsem', 'activitiesservlearn'
  ))
  or
  (entity_name = 'y1_continuity_clinics' and attribute_name in (
    'fp', 'residents', 'fellows', 'otherspec', 'np', 'pa', 'rnlpn', 'ma',
    'allied', 'admstaff', 'psych', 'social', 'diet', 'pteduc', 'busmgr',
    'pracptct', 'ptgendm', 'ptgendf', 'under3', 'age3_17', 'age18_24',
    'age25_44', 'age45_64', 'age65_74', 'over75', 'ethhispanic',
    'ethnothispanic', 'ptindian', 'ptasian', 'ptblack', 'ptpacific',
    'ptwhite', 'ptother', 'prepaid', 'fee4svc', 'medicare', 'medicaid',
    'otherpay', 'uninsure', 'pgy1routine', 'pgy2routine', 'pgy3routine',
    'pgy4routine', 'pgy1acute', 'pgy2acute', 'pgy3acute', 'pgy4acute',
    'daysnewapptfac', 'daysnewapptres', 'daysfuapptfac', 'daysfuapptres',
    'daysacuteapptfac', 'daysacuteapptres', 'numexamrooms',
    'numptlastyrfac', 'numptlastyrres', 'ftefp', 'ftefmres', 'fteped',
    'ftepedres', 'fteim', 'fteimres', 'fteob', 'fteobres', 'fteotherphys1',
    'fteotherphys2', 'fteotherphys3', 'ftenp', 'ftepa', 'fternlpn', 'ftema',
    'fteallied', 'fteadmin', 'ftepsych', 'ftesocial', 'ftediet',
    'ftepteduc', 'fteotherspec1', 'fteotherspec2', 'fteotherspec3', 'numnp',
    'numpa', 'numrnlpn', 'numma', 'numallied', 'numpsych', 'numsocial',
    'numdiet', 'numpteduc', 'numotherspec', 'emryrs'
  ))
  or
  (entity_name = 'y1_residency_programs' and attribute_name in (
    'numinterviewed', 'numfilledmatchusallo', 'numfilledmatchusosteo',
    'numfilledmatchintl', 'numfilledjulyusallo', 'numfilledjulyusosteo',
    'numfilledjulyintl', 'resleave', 'resleavepgy1', 'resleavepgy2',
    'resleavepgy3', 'resleavepgy4', 'pctaafp', 'numqipgy1avail',
    'numqipgy1res', 'numqipgy2avail', 'numqipgy2res', 'numqipgy3avail',
    'numqipgy3res', 'numqipgy4avail', 'numqipgy4res', 'numrschpgy1avail',
    'numrschpgy1res', 'numrschpgy2avail', 'numrschpgy2res',
    'numrschpgy3avail', 'numrschpgy3res', 'numrschpgy4avail',
    'numrschpgy4res', 'pctpeerreview', 'pctnonpeerreview', 'pctpresenting',
    'revgrants', 'revcharity', 'revstate', 'revmedicaredirect',
    'revmedicareindirect', 'revmedicarehmo', 'revmedicaredisproportionate',
    'revmedicaiddirect', 'revmedicaidindirect', 'revhospitalgme',
    'revother', 'revtotal', 'expfacultyfte', 'expfacultysalary',
    'expstafffte', 'expstaffsalary', 'expbenefits', 'expcontracts',
    'expequipment', 'expsupplies', 'exprent', 'expotherresop',
    'exprecruitment', 'exphospitalgme', 'expmalpractice', 'exphospstepdown',
    'expmedschool', 'expdme', 'expdfm', 'expother', 'exptotal',
    'facsalaryexp', 'volfacultyexp', 'clinstaffexp', 'nonclinstaffexp',
    'recruitexp', 'contractexp', 'capitalexp', 'billingisexp',
    'grantsrev', 'charitablerev', 'ptcarerev', 'techancrev'
  ))
  or
  (entity_name = 'y1_graduate_responses' and attribute_name in (
    'q21', 'q45', 'q47', 'q48', 'q50', 'q51', 'q52',
    'q53', 'q54', 'q55', 'q108', 'q109'
  ))
  or
  (entity_name = 'y2_graduate_responses' and attribute_name in (
    'q105', 'q205', 'q206',
    'q207a', 'q207b', 'q207c', 'q207d', 'q207e', 'q207f', 'q208'
  ))
  or
  (entity_name = 'y3_graduate_responses' and attribute_name in (
    'q105', 'q205', 'q206',
    'q207a', 'q207b', 'q207c', 'q207d', 'q207e', 'q207f', 'q208'
  ))
  or
  (entity_name = 'y4_graduate_responses' and attribute_name in (
    'q105', 'q205', 'q206',
    'q207a', 'q207b', 'q207c', 'q207d', 'q207e', 'q207f', 'q208'
  ))
  or
  (entity_name = 'y5_graduate_responses' and attribute_name in (
    'q105', 'q205', 'q206',
    'q207a', 'q207b', 'q207c', 'q207d', 'q207e', 'q207f', 'q208'
  ))
  or
  (entity_name = 'y6_graduate_responses' and attribute_name in (
    'q105', 'q205', 'q206',
    'q207a', 'q207b', 'q207c', 'q207d', 'q207e', 'q207f', 'q208'
  ))
  or
  (entity_name = 'y2_resident_responses' and attribute_name in (
    'age', 'many', 'yearsbeforemedschool', 'activitiesclinrot',
    'activitieslectsem', 'activitiesservlearn'
  ))
  or
  (entity_name = 'y2_continuity_clinics' and attribute_name in (
    'pgy1', 'pgy2', 'pgy3', 'pgy4', 'totpgy',
    'male', 'female', 'lt3', 'three', 'eighteen', 'twentyfive',
    'fortyfive', 'sixtyfive', 'seventyfive', 'hispanic', 'nonhispanic',
    'indian', 'asian', 'black', 'hawaiian', 'white', 'otherrace',
    'prepaid', 'ffs', 'medicare', 'medicaid', 'otherpay', 'uninsured',
    'pgy1routine', 'pgy2routine', 'pgy3routine',
    'pgy4routine', 'pgy1acute', 'pgy2acute', 'pgy3acute', 'pgy4acute',
    'daysnewapptfac', 'daysnewapptres', 'daysfuapptfac',
    'daysfuapptres', 'daysacuteapptfac', 'daysacuteapptres',
    'daysnewapptfac3', 'daysnewapptres3', 'daysfuapptfac3',
    'daysfuapptres3', 'daysacuteapptfac3', 'daysacuteapptres3',
    'numexamrooms', 'numptfac', 'numptres', 'numptmid', 'ftefp', 'ftefmres',
    'fteped', 'ftepedres', 'fteim', 'fteimres', 'fteob', 'fteobres',
    'fteotherphys1', 'fteotherphys2', 'fteotherphys3', 'ftenp', 'ftepa',
    'fternlpn', 'ftema', 'fteallied', 'fteadmin', 'ftepsych', 'ftesocial',
    'ftediet', 'ftepteduc', 'fteotherspec1', 'fteotherspec2', 'fteotherspec3',
    'numnp', 'numpa', 'numrnlpn', 'numma', 'numallied', 'numpsych', 'numsocial',
    'numdiet', 'numpteduc', 'numotherspec', 'emryrs'
  ))
  or
  (entity_name = 'y2_residency_programs' and attribute_name in (
    'numinterviewed', 'numfilledmatchusallo', 'numfilledmatchusosteo',
    'numfilledmatchintl', 'numfilledjulyusallo', 'numfilledjulyusosteo',
    'numfilledjulyintl', 'resleave', 'resleavepgy1', 'resleavepgy2',
    'resleavepgy3', 'resleavepgy4', 'pctaafp', 'numqipgy1avail',
    'numqipgy1res', 'numqipgy2avail', 'numqipgy2res', 'numqipgy3avail',
    'numqipgy3res', 'numqipgy4avail', 'numqipgy4res', 'numrschpgy1avail',
    'numrschpgy1res', 'numrschpgy2avail', 'numrschpgy2res',
    'numrschpgy3avail', 'numrschpgy3res', 'numrschpgy4avail',
    'numrschpgy4res', 'pctpeerreview', 'pctnonpeerreview', 'pctpresenting',
    'revgrants', 'revcharity', 'revstate', 'revmedicaredirect',
    'revmedicareindirect', 'revmedicarehmo', 'revmedicaredisproportionate',
    'revmedicaiddirect', 'revmedicaidindirect', 'revhospitalgme',
    'revother', 'revtotal', 'expfacultyfte', 'expfacultysalary',
    'expstafffte', 'expstaffsalary', 'expbenefits', 'expcontracts',
    'expequipment', 'expsupplies', 'exprent', 'expotherresop',
    'exprecruitment', 'exphospitalgme', 'expmalpractice', 'exphospstepdown',
    'expmedschool', 'expdme', 'expdfm', 'expother', 'exptotal',
    'facsalaryexp', 'volfacultyexp', 'clinstaffexp', 'nonclinstaffexp',
    'recruitexp', 'contractexp', 'capitalexp', 'billingisexp',
    'grantsrev', 'charitablerev', 'ptcarerev', 'techancrev'
  ))
  or
  (entity_name in ('y3_resident_responses', 'y4_resident_responses','y5_resident_responses') and attribute_name in (
    'age', 'many', 'yearsbeforemedschool', 'activitiesclinrot',
    'activitieslectsem', 'activitiesservlearn'
  ))
  or
  (entity_name in ('y3_continuity_clinics', 'y4_continuity_clinics','y5_continuity_clinics') and attribute_name in (
    'pgy1', 'pgy2', 'pgy3', 'pgy4', 'totpgy',
    'male', 'female', 'lt3', 'three', 'eighteen', 'twentyfive',
    'fortyfive', 'sixtyfive', 'seventyfive', 'hispanic', 'nonhispanic',
    'indian', 'asian', 'black', 'hawaiian', 'white', 'otherrace',
    'prepaid', 'ffs', 'medicare', 'medicaid', 'otherpay', 'uninsured',
    'pgy1routine', 'pgy2routine', 'pgy3routine',
    'pgy4routine', 'pgy1acute', 'pgy2acute', 'pgy3acute', 'pgy4acute',
    'daysnewapptfac3', 'daysnewapptres3', 'daysfuapptfac3',
    'daysfuapptres3', 'daysacuteapptfac3', 'daysacuteapptres3',
    'numexamrooms', 'numptfac', 'numptres', 'numptmid', 'ftefp', 'ftefmres',
    'fteped', 'ftepedres', 'fteim', 'fteimres', 'fteob', 'fteobres',
    'fteotherphys1', 'fteotherphys2', 'fteotherphys3', 'ftenp', 'ftepa',
    'fternlpn', 'ftema', 'fteallied', 'fteadmin', 'ftepsych', 'ftesocial',
    'ftediet', 'ftepteduc', 'fteotherspec1', 'fteotherspec2', 'fteotherspec3',
    'numnp', 'numpa', 'numrnlpn', 'numma', 'numallied', 'numpsych', 'numsocial',
    'numdiet', 'numpteduc', 'numotherspec', 'emryears', 'ftepharm'
  ))
  or
  (entity_name in ('y3_residency_programs', 'y4_residency_programs','y5_residency_programs') and attribute_name in (
    'numinterviewed', 'numfilledmatchusallo', 'numfilledmatchusosteo',
    'numfilledmatchintl', 'numfilledjulyusallo', 'numfilledjulyusosteo',
    'numfilledjulyintl', 'resleave', 'resleavepgy1', 'resleavepgy2',
    'resleavepgy3', 'resleavepgy4', 'pctaafp', 'numqipgy1avail',
    'numqipgy1res', 'numqipgy2avail', 'numqipgy2res', 'numqipgy3avail',
    'numqipgy3res', 'numqipgy4avail', 'numqipgy4res', 'numrschpgy1avail',
    'numrschpgy1res', 'numrschpgy2avail', 'numrschpgy2res',
    'numrschpgy3avail', 'numrschpgy3res', 'numrschpgy4avail',
    'numrschpgy4res', 'pctpeerreview', 'pctnonpeerreview', 'pctpresenting'
  ))
  or
  (entity_name in ('y1_webads_responses', 'y2_webads_responses') and attribute_name in (
    'pgy1activefulltime', 'pgy1activeparttime', 'pgy1completed', 'pgy2activefulltime',
    'pgy2activeparttime', 'pgy2completed', 'pgy3activefulltime', 'pgy3activeparttime',
    'pgy3completed', 'pgy4activefulltime', 'pgy4activeparttime', 'pgy4completed',
    'dailyptsadultyr1', 'dailyptsadultyr2', 'dailyptsadultyr3', 'dailyptsnewbornyr1',
    'dailyptsnewbornyr2', 'dailyptsnewbornyr3', 'dailyptspedsyr1', 'dailyptspedsyr2',
    'dailyptspedsyr3'
  ))
);

commit;

vacuum analyze;

