require_relative 'routes/sourcetexts'

class LuhistinServer < Sinatra::Base
	get '/' do
		erb :index
	end
end
