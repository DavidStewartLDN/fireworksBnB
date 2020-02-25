if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new :spec
  task default: [:spec]
end

# Depends on the name of our app controller file
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require './app/app'
