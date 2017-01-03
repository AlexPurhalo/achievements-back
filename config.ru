require 'rack'
require 'rubygems'
require 'bundler/setup'
require 'grape'
require 'rack/cors'
require 'rabl'
require 'carrierwave'
require 'carrierwave/sequel'
require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'
require 'sequel'
require 'fog'


DB = Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://db/database.db')

require './app/core'

run App

use Rack::Cors do
  allow do
    origins '*'
    resource '*',
             :headers => :any,
             :methods => [:get, :post, :delete, :put, :options]
  end
end

use Rack::Config do |env|
  env['api.tilt.root'] = 'app/views'
end

Rabl.configure do |config|
  config.include_json_root = false
  config.include_child_root = false
end

CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => 'AKIAIAE5UKATH3QNC6OA',
      :aws_secret_access_key  => '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',
      :region                 => 'us-west-2'
  }
  config.fog_directory  = 'achievements-aws'
end