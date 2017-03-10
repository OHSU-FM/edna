
for file in data/match/*.csv; do
  source="`echo $file | sed '
    s/^data\/match\/\([A-Za-z0-9]*\)_.*$/\1/
  '`"
  pool="`echo $file | awk '
    /_? *Allopathic/ { print "Allopathic"; }
    /_? *DO/ { print "DO"; }
    /_? *Traditional/ { print "Traditional"; }
    /_? *Combined/ { print "Combined"; }
    /_? *Rural/ { print "Rural"; }
  '`"
  track="`echo $file | awk '
    /_? *UH.csv$/ { print "UH"; } /_? *DH.csv$/ { print "DH"; }
  '`"
  echo "$file" >&2
  ruby scripts/p4-match-parser.rb "$source" "$pool" "$track" < "$file"
done
