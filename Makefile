# Originally Coded by David Brown
# Additional work by William Hatt 2012-01-19-Present
#
# A collection of tools for manipulating data collected for the 
# p4 project.

SHELL := /bin/bash

# (option) make all: Run all commands (in this order)
all: doenv
	# Commands are already run in the appropriate order because of migration numbering
	source ./tmp/env.sh && ruby ./bin/fake_rake.rb --dir ./db/data-migrations

most: doenv
	source ./tmp/env.sh && ruby ./bin/fake_rake.rb 000 998 --dir ./db/data-migrations

analyze: doenv
	source ./tmp/env.sh && ruby ./bin/fake_rake.rb 901 902 --dir ./db/data-migrations  

statistics: doenv transform
	source ./tmp/env.sh && ruby ./bin/fake_rake.rb 999 --dir ./db/data-migrations  
  
doenv:
	./bin/setenv.rb > ./tmp/env.sh

clean: doenv
	source ./tmp/env.sh && ruby ./bin/fake_rake.rb 000 002 --dir ./db/data-migrations 

export: doenv
	source ./tmp/env.sh && ruby ./bin/export_tables.rb

