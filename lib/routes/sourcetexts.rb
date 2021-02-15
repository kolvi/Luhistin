require 'pry'

class LuhistinServer < Sinatra::Base

  def read_bodypars
    begin
      JSON.parse(request.body.read, symbolize_names: true)
    rescue JSON::ParserError
      halt 400
    end
  end

  def read_columns_of(model_class)
    pars = read_bodypars

    # Ensure that:
    # 1. all parameters are actually columns of the class
    # 2. "id" is not one of them!

    available_keys = model_class.columns-[:id]
    halt 400 unless (pars.keys - available_keys).empty?
    pars
  end

  def sourcetext_by_id
    Sourcetext[params[:id]] || (halt 404)
  end

  def success_with(stext)
    status 200
    stext.values.to_json
  end

  def success_with_all(model_class)
    status 200
    model_class.all.map(&:values).to_json
  end

  get '/sourcetext/:id' do
    success_with sourcetext_by_id 
  end

  get '/sourcetexts' do
    success_with_all(Sourcetext)
  end

  post '/sourcetext' do
    body_params = read_columns_of(Sourcetext)
    begin
      stext = Sourcetext.create(body_params)
    rescue Sequel::Error
      halt 400
    end
    success_with stext
  end

  patch '/sourcetext/:id' do
    begin
       body_params = read_columns_of(Sourcetext)
       sourcetext_by_id.set_fields(body_params, body_params.keys).save

    rescue Sequel::Error
       halt 400
    end
     success_with( Sourcetext[params[:id]] )
  end

  delete '/sourcetext/:id' do
    sourcetext_by_id.delete
    status 200
  end

end