# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rspec'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

module ControllerMacros
  def logged_in_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = Fabricate.build(:user)
      sign_in user
    end
  end
end

RSpec.configure do |config|
  config.mock_with :rspec

  config.include Mongoid::Matchers

  config.infer_base_class_for_anonymous_controllers = false

  config.include Devise::TestHelpers, :type => :controller
  config.extend ControllerMacros, :type => :controller

  require 'database_cleaner'
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.orm = "mongoid"
  end
  config.before(:each) do
    DatabaseCleaner.clean
  end
end


