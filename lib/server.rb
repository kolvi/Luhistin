set :public_folder, __dir__ + '/../client/dist'

require 'pry'
get '/' do
	erb :index
end
