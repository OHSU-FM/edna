#!/bin/bash --

function load_data()
{
    line=""

    # Generate sql output
    echo "Loading: "$DATA_VAR
    DATA="$(ruby ./bin/csv_to_sql.rb $DATA_VAR)"

    # Exit if there was an error generating sql statement
    if [ $? != 0 ]
    then
        echo -e "\e[01;31mCSV LOAD ERROR\e[0m" >&2
        exit 2
    fi

    # Run sql statement
    ERROR=$( echo $DATA | psql -U $DB_USERNAME $DB_DATABASE 2>&1 >/dev/null )

    # Exit if there was an error in running sql statement
    if [ "x$ERROR" != "x" ]
    then
        echo -e "\e[01;31m$ERROR\e[0m" >&2
        exit 2
    fi
}

# Critical Values Data
CRIT_VARS=(
	'transform.critical_values ./db/data/critical_values.csv'
)

# actual data
DATA_VARS=('source.y1_residency_programs ./db/data/y1_residency_programs.csv'
    'source.y1_continuity_clinics ./db/data/y1_continuity_clinics.csv'
    'source.y1_resident_responses ./db/data/y1_resident_responses.csv'
    'source.y1_graduate_responses ./db/data/y1_graduate_responses.csv'
    'source.y2_graduate_responses ./db/data/y2_graduate_responses.csv'
    'source.y3_graduate_responses ./db/data/y3_graduate_responses.csv'
    'source.y4_graduate_responses ./db/data/y4_graduate_responses.csv'
    'source.y5_graduate_responses ./db/data/y5_graduate_responses.csv'
    'source.y6_graduate_responses ./db/data/y6_graduate_responses.csv'
    'source.y7_graduate_responses ./db/data/y7_graduate_responses.csv'
    'source.y2_residency_programs ./db/data/y2_residency_programs.csv'
    'source.y2_continuity_clinics ./db/data/y2_continuity_clinics.csv'
    'source.y2_resident_responses ./db/data/y2_resident_responses.csv'
    'source.y3_residency_programs ./db/data/y3_residency_programs.csv'
    'source.y3_continuity_clinics ./db/data/y3_continuity_clinics.csv'
    'source.y3_resident_responses ./db/data/y3_resident_responses.csv'
    'source.y4_residency_programs ./db/data/y4_residency_programs.csv'
    'source.y4_continuity_clinics ./db/data/y4_continuity_clinics.csv'
    'source.y4_resident_responses ./db/data/y4_resident_responses.csv'
    'source.y5_residency_programs ./db/data/y5_residency_programs.csv'
    'source.y5_continuity_clinics ./db/data/y5_continuity_clinics.csv'
    'source.y5_resident_responses ./db/data/y5_resident_responses.csv'
    'source.p4_programs ./db/data/p4_programs.csv'
    'source.p4_clinics ./db/data/p4_clinics.csv'
    'source.p4_residents ./db/data/p4_residents.csv'
    'source.p4_resident_clinics ./db/data/p4_resident_clinics.csv'
    'source.p4_residents_nonconsenting ./db/data/p4_residents_nonconsenting.csv'
    'source.y1_webads_responses ./db/data/y1_webads_responses.csv'
    'source.y2_webads_responses ./db/data/y2_webads_responses.csv'
    'target.meta_attribute_entities ./db/data/meta_attribute_entites.csv'
    'target.meta_attribute_questions ./db/data/meta_attribute_questions.csv'
)

echo	Missing the following data files:
echo    'source.p4_webads_rankings ./db/data/output/y1_webads_rankings_normalized.csv'
echo    'source.p4_webads_rankings ./db/data/output/y2_webads_rankings_normalized.csv'


# Metadata
META_VARS=(
		'source.meta_attribute_values ./db/data/y1_residency_programs_meta.csv'
		'source.meta_attribute_values ./db/data/y1_continuity_clinics_meta.csv'
		'source.meta_attribute_values ./db/data/y1_resident_responses_meta.csv'
		'source.meta_attribute_values ./db/data/y1_graduate_responses_meta.csv'
		'source.meta_attribute_values ./db/data/y2_graduate_responses_meta.csv'
		'source.meta_attribute_values ./db/data/y3_graduate_responses_meta.csv'
		'source.meta_attribute_values ./db/data/y4_graduate_responses_meta.csv'
		'source.meta_attribute_values ./db/data/y5_graduate_responses_meta.csv'
		'source.meta_attribute_values ./db/data/y6_graduate_responses_meta.csv'
		'source.meta_attribute_values ./db/data/y7_graduate_responses_meta.csv'
		'source.meta_attribute_values ./db/data/y2_residency_programs_meta.csv'
		'source.meta_attribute_values ./db/data/y2_continuity_clinics_meta.csv'
		'source.meta_attribute_values ./db/data/y2_resident_responses_meta.csv'
		'source.meta_attribute_values ./db/data/y3_residency_programs_meta.csv'
		'source.meta_attribute_values ./db/data/y3_continuity_clinics_meta.csv'
		'source.meta_attribute_values ./db/data/y4_residency_programs_meta.csv'
		'source.meta_attribute_values ./db/data/y4_continuity_clinics_meta.csv'
		'source.meta_attribute_values ./db/data/y5_residency_programs_meta.csv'
		'source.meta_attribute_values ./db/data/y5_continuity_clinics_meta.csv'
		'source.meta_attribute_values ./db/data/y5_resident_responses_meta.csv'
		'source.meta_attribute_values ./db/data/y4_resident_responses_meta.csv'
		'source.meta_attribute_values ./db/data/y3_resident_responses_meta.csv'
)

echo 	Missing the following meta_data files
echo		'source.meta_attribute_values ./db/data/y1_webads_responses_meta.csv'
echo		'source.meta_attribute_values ./db/data/y2_webads_responses_meta.csv'

for DATA_VAR in "${CRIT_VARS[@]}"
do
    load_data
done

for DATA_VAR in "${DATA_VARS[@]}"
do
    load_data
done

for DATA_VAR in "${META_VARS[@]}"
do
    load_data
done

