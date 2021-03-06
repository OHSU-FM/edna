source 'https://rubygems.org'

##############################
# Main
##############################

# Rails version
gem 'rails', '~> 4.2.1'
gem 'rack', '~> 1.6.1'
gem 'rdoc' # documentation
# Database
gem 'pg'
gem 'composite_primary_keys'

# Record Versioning
gem 'paper_trail', '~> 4.0.0.rc'

gem 'php-serialize'

##############################
# Admin/Config/Security
##############################
# Administration Panel
gem 'rails_admin'#, '~> 0.6.7'

# Needed until we migrate to strong-parameters
gem 'protected_attributes'

# Config file loader
# see ./lib/settings.rb and ./config/settings.yml for details
gem 'settingslogic'

# Authorization
gem 'cancancan'

# Authentication
gem "devise"
# LDAP
gem 'devise_ldap_authenticatable'
# Prevent Excessive log file information
gem 'lograge'

##############################
# JavaScript and CSS
##############################

gem 'sass-rails'#, '~> 4.0.0'
gem 'coffee-rails'
gem 'uglifier'
# jquery
gem 'jquery-rails'
gem 'jquery-ui-rails'

# - Breaks:
#   -- dashboard
#   -- reports/filter
#   -- reports/graph
#gem 'turbolinks'

# CSS / js
gem 'bootstrap-sass'#, '~> 3.1.1.1'
# Random bug:
# Error encountered while saving cache (".....") can't dump anonymous class
# http://stackoverflow.com/questions/22276991/heroku-error-encountered-while-saving-cache
gem 'sass'#, '~> 3.2.13'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', :platforms => :ruby

##############################
# UI: Charts
##############################

gem 'json'
gem 'gon'

##############################
# UI: Forms
##############################

# Dynamic Forms
gem 'cocoon'
gem 'simple_form'

##############################
# UI: Misc
##############################

# Static Pages
gem 'high_voltage'
# Statistics
gem 'descriptive-statistics'

##############################
# Analysis
##############################
gem 'statistics2'

##############################
# Environments
##############################

group :test do 
    gem 'minitest-rails'
    gem "minitest-rails-capybara"
    gem 'rails-perftest'
    gem "factory_girl_rails", "~> 4.0"

end

group :test, :development do
    if RUBY_VERSION =~ /^1.9.3/
        # Better error messages in development
        gem 'better_errors', '~> 1.1.0'
    elsif RUBY_VERSION =~ /^2.2./
        gem 'pry-rails'
    end

end

group :production do
    # Send emails to admin when an error occurs
    gem 'exception_notification'
end

# To use debugger
group :development do
    gem "rack-mini-profiler", require: false
    gem 'flamegraph'

    if RUBY_VERSION =~ /^1.9.3/
        # Better error messages in development
        gem 'better_errors', '~> 1.1.0'
    elsif RUBY_VERSION =~ /^2.2./
        gem 'stackprof'
        gem 'ruby-prof'
        gem 'better_errors'
    end
     
    gem 'webrick'
    gem 'thin'
    gem 'rails_layout'
    gem 'awesome_print'

    
    # Interactive debugging from the web
    gem 'binding_of_caller'#, :platforms=>[:ruby_19, :ruby_22]
    gem 'redcarpet'
end
