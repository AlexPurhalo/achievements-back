require 'rack'
require 'rubygems'
require 'bundler/setup'
require 'grape'
require 'rack/cors'
require 'rabl'
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