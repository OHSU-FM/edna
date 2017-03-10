#!/bin/bash --
ruby ./bin/p4-webads-normalizer.rb 2007 \
< ./db/data/y1_webads_rankings.csv \
> ./db/data/output/y1_webads_rankings_normalized.csv && \
ruby ./bin/p4-webads-normalizer.rb 2008 \
< ./db/data/y2_webads_rankings.csv \
> ./db/data/output/y2_webads_rankings_normalized.csv

