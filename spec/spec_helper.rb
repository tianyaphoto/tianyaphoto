ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = false

  config.include Devise::TestHelpers, :type => :controller

  DatabaseCleaner.strategy = :truncation
  config.before do 
    DatabaseCleaner.clean
  end
end
