require 'pry'
require 'dotenv'
Dotenv.load

require 'sinatra'
require 'sequel'

#DB = Sequel.connect(adapter: :postgres, user: ENV['DB_USER'], password: ENV['DB_PASSWORD'], database: 'luhistin')
#binding.pry

require_relative 'lib/luhistin.rb'
require_relative 'lib/server.rb'
