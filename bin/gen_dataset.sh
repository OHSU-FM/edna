#!/bin/bash --
#
#   ?
#
#
function dump_dataset()
{
    echo "dumping table to CSV: target."$TABLE
    echo "DELETE FROM $TABLE;" >> $OUTFILE
    psql -U sa p4_reporting_test -c "COPY(SELECT * FROM target.$TABLE) TO STDOUT WITH CSV HEADER;" > $DIR/tmp/$TABLE.csv 
    echo "Generating SQL"
    $DIR/scripts/csv_to_sql.rb no_transaction $TABLE $DIR/tmp/$TABLE.csv >> $OUTFILE
    rm $DIR/tmp/$TABLE.csv
}

# find base directory path
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../"
OUTFILE=$DIR/tmp/pcor_dataset.sql

# Create a temporary directory if one does not exist
if [ ! -d "$DIR/tmp" ]; then
    echo Creating tmp dir
    mkdir "$DIR/tmp"
fi

# Delete output file if it exists
if [ -f $OUTFILE ]
then
    rm $OUTFILE
fi
touch $OUTFILE

echo "BEGIN TRANSACTION;" >> $OUTFILE

TABLES=(
    'meta_attribute_statistics'
    'meta_attribute_values'
)

for TABLE in "${TABLES[@]}"
do
    dump_dataset
done

echo "COMMIT;" >> $OUTFILE

