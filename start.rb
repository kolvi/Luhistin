#require 'pry'

require 'dotenv'
require 'sinatra/base'
require 'sequel'

require_relative 'lib/server.rb'

class LuhistinServer < Sinatra::Base
  set :public_folder, __dir__ + '/client/dist'
  #set :public_folder, '/.client/dist'
  set :root, __dir__ + '/'
  #set :root, File.dirname(__FILE__)
  #set :root, __dir__ + '.'

  run!
end

require_relative 'db/model/all.rb'
require_relative 'lib/luhistin.rb'
