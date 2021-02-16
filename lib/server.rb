require_relative 'routes/sourcetexts'

# Initialising Sinatra stuff

#Sequel.extension :core_extensions

class LuhistinServer < Sinatra::Base
	get '/' do
		erb :index
	end
end
