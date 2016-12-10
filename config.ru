require 'rack'
require 'rubygems'
require 'bundler/setup'
require 'grape'
require 'rack/cors'
require 'rabl'
require 'carrierwave'
require 'carrierwave/orm/activerecord'
require './app/core'

run App

use ActiveRecord::ConnectionAdapters::ConnectionManagement

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
      :aws_access_key_id      => 'AKIAJ57P7IDFWSWETF7Q',
      :aws_secret_access_key  => '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',
      :region                 => 'us-west-2'
  }
  config.fog_directory  = 'achievements-bucket'
end