require 'rack'
require 'rubygems'
require 'bundler/setup'
require 'grape'
require 'rack/cors'
require './app/core'

run Users

use ActiveRecord::ConnectionAdapters::ConnectionManagement

use Rack::Cors do
  allow do
    origins '*'
    resource '*',
             :headers => :any,
             :methods => [:get, :post, :delete, :put, :options]
  end
end