require 'dotenv'
#require 'sequel'

Dotenv.load

#Sequel.extension :pg_json_ops
DB = Sequel.connect(adapter: :postgres,
  	user: ENV['DB_USER'],
  	password: ENV['DB_PASSWORD'],
  	database: 'luhistin')

Sequel.extension :core_extensions
DB.extension :pg_array, :pg_row
DB.register_row_type(:distortion)

Sequel::Model.db = DB

require_relative 'recipe'
require_relative 'textsource'
