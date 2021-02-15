require 'dotenv'
require 'sequel'

Dotenv.load

DB = Sequel.connect(adapter: :postgres,
  	user: ENV['DB_USER'],
  	password: ENV['DB_PASSWORD'],
  	database: 'luhistin')

Sequel::Model.db = DB

require_relative 'textsource'
