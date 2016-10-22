ENV['RACK_ENV'] = 'test'

require 'bundler'

Bundler.require
Bundler.require :test

require 'rspec'
require 'rack/test'
require 'shoulda/matchers'

require './app/core'

RSpec.configure do |config|
  config.include Rack::Test::Methods

  config.color = true
  config.formatter = :documentation

  config.before(:suite) do
    ActiveRecord::Base.logger = nil
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :active_record
    with.library :active_model
  end
end