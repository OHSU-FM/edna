#!/bin/bash

# TODO: Alter this script to pull authentication information from ./rails/config/database.yml
#   - dump contents of p4_reporting(new data) and p4_pcor(backup): (to csv file)
#       - meta_attribute_statistics
#       - meta_attribute_values
#   - Wipe the above two tables
#   - Load the contents of the two csv files (p4_reporting loaded into p4_pcor)

# Note the time for file names
STAMP=`date +%Y-%m-%d_%H`

# find scripts directory path
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Create a temporary directory if one does not exist
if [ ! -d "$DIR/../tmp" ]; then
    echo Creating tmp dir
    mkdir "$DIR/../tmp"
fi

FOUT=$DIR'/../tmp/pcor_meta_dump_'$STAMP'.out'
touch $FOUT
FOUT=`realpath $FOUT`

# backup the production database and dump new data from test site
echo 'Creating new dataset...'
echo 'BEGIN TRANSACTION;' > $FOUT
echo 'DELETE FROM target.meta_attribute_statistics;' >> $FOUT
echo 'DELETE FROM target.meta_attribute_values;' >> $FOUT
pg_dump -U $DB_USERNAME $DB_DATABASE  --column-inserts --data-only --table target.meta_attribute_statistics >> $FOUT
pg_dump -U $DB_USERNAME $DB_DATABASE  --column-inserts --data-only --table target.meta_attribute_values >> $FOUT
echo 'COMMIT;' >> $FOUT
echo 'Export created at: '$FOUT
