module LimeExt
mattr_accessor :table_prefix
mattr_accessor :schema

@@table_prefix = 'lime'
@@schema = 'public'

class Application < Rails::Application

config.after_initialize do
# make sure all models have been loaded
Rails.application.eager_load!

# Add extensions to some models
end

end
end

require 'lime_ext/errors'
require 'lime_ext/response_loaders'
require 'lime_ext/lime_stat'
require 'lime_ext/poly_table_model'
require 'lime_ext/lime_tokens'
require 'lime_ext/lime_data'
