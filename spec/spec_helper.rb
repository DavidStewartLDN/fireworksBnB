require "capybara"
require "capybara/rspec"
require "rspec"
require "sinatra/activerecord"
require_relative "../app/app"

ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'


# ENV["ENVIRONMENT"] = "test"

Capybara.app = FireworksBnB

Capybara.default_driver = :selenium
Capybara.server = :webrick

DB_ENV ||='test'
connection_details =YAML::load(File.open('./config/database.yml'))
ActiveRecord::Base.establish_connection(connection_details[DB_ENV])


RSpec.configure do |config|
  config.before(:each) do
    ActiveRecord::Base.connection.execute('DELETE FROM bookings;')
    ActiveRecord::Base.connection.execute('DELETE FROM spaces;')
    ActiveRecord::Base.connection.execute('DELETE FROM users;')
  end
  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
