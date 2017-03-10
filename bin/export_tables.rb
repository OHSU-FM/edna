#!/usr/bin/env ruby

# Boot rails application so that we can access models etc...
require File.expand_path('../../config/boot',  __FILE__)
require File.expand_path('../../config/application',  __FILE__)
# set Rails.env here if desired
Rails.application.require_environment!

# Create temp directory 
time_stamp = Time.now.strftime('%Y%m%d%H%M%S')
tmp_path = "./tmp/table_dumps_#{time_stamp}"
FileUtils::mkdir_p tmp_path

# Get config
config   = Rails.configuration.database_configuration
database = config[Rails.env]["database"]
username = config[Rails.env]["username"]

get_data = true
if ARGV.include? '--no-data'
    get_data = false
end

# Dump tables
ActiveRecord::Base.connection.tables.each do |table|
    system "pg_dump -U #{username} #{database} #{ '-s' unless get_data } -t '*.#{table}' -f #{tmp_path}/#{table}.dump.sql"
end
