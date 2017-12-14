# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../dummy/config/environment.rb', __FILE__)
require 'rspec/rails'
require 'factory_bot_rails'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'sidekiq/testing'
require 'support/database_cleaner'
Sidekiq::Testing.inline!
Rails.backtrace_cleaner.remove_silencers!

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

Capybara.javascript_driver = :poltergeist
options = { js_errors: false }
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, options)
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.include Capybara::DSL
  config.include Rails.application.routes.url_helpers
  config.mock_with :rspec
  config.use_transactional_fixtures = false
  config.infer_base_class_for_anonymous_controllers = false
  config.order = 'random'
end
