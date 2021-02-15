require_relative 'routes/sourcetexts'

#set :public_folder, __dir__ + '/../client/dist'
#set :views, File.dirname(__FILE__) + '/views'
#set :views, __dir__ + '/../views'
#set :views, File.dirname(__FILE__) + '../views'

class LuhistinServer < Sinatra::Base

	#set :public_folder, __dir__ + '/../client/dist'

	get '/' do
		erb :index
	end
	#run!
end
