ENV['RACK_ENV']= "test"

require 'capybara/rspec'
require './app/app'
require './app/models/user'
require 'database_cleaner'
require_relative 'helpers/session'
require_relative 'features/web_helper'

#require 'features/web_helpers'
#require 'helpers/session'
Capybara.app = FourM

RSpec.configure do |config|

  config.include SessionHelpers

  config.before(:each) do
    DataMapper.setup(:default, "postgres://localhost/four_m_test")
  end

  config.after(:each) do
    DataMapper.setup(:default, "postgres://localhost/four_m_development")
  end

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

end
