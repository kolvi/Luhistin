require 'pry'
require 'dotenv'
Dotenv.load

require 'sinatra'
require 'sequel'

#DB = Sequel.connect(adapter: :postgres, user: ENV['DB_USER'], password: ENV['DB_PASSWORD'], database: 'luhistin')

DB = Sequel.connect(adapter: :postgres,
  	user: ENV['DB_USER'],
  	password: ENV['DB_PASSWORD'],
  	database: 'luhistin')

Sequel::Model.db = DB

require_relative 'db/model/all.rb'
require_relative 'lib/luhistin.rb'
require_relative 'lib/server.rb'

binding.pry
