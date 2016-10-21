require 'rack'
require 'rubygems'
require 'bundler/setup'
require 'grape'
require './app/core'

run Users

use ActiveRecord::ConnectionAdapters::ConnectionManagement