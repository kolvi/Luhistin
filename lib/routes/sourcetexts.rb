require 'pry'

class LuhistinServer < Sinatra::Base

  def read_bodypars
    begin
      JSON.parse(request.body.read, symbolize_names: true)
    rescue JSON::ParserError
      halt 400
    end
  end

  def sourcetext_by_id
    Sourcetext[params[:id]] || (halt 404)
  end

  def ensure_parameters_are_keys_for (model_class, parameter_hash)
    # Ensude that:
    # 1. all parameters are actually columns of the class
    # 2. "id" is not one of them!
    available_keys = model_class.columns-[:id]
    halt 400 unless (parameter_hash.keys - available_keys).empty?
  end

#  def success_with_sourcetext(stext_id)
#    status 200
#    Sourcetext[stext_id].values.to_json
#  end

  def success_with_sourcetext(stext)
    status 200
    stext.values.to_json
  end

  get '/sourcetext/:id' do
    success_with_sourcetext( sourcetext_by_id )
  end

  post '/sourcetext' do
    body_params = read_bodypars
    ensure_parameters_are_keys_for(Sourcetext, body_params)
    begin
      stext = Sourcetext.create(body_params)
    rescue Sequel::Error
      halt 400
    end
    success_with_sourcetext stext
  end


  patch '/sourcetext/:id' do
    begin
       body_params = read_bodypars
       ensure_parameters_are_keys_for(Sourcetext, body_params)

       # Set all keys
       (sourcetext_by_id).set_fields(body_params, body_params.keys).save

    rescue Sequel::Error
       halt 400
    end
     success_with_sourcetext( Sourcetext[params[:id]] )
  end

  delete '/sourcetext/:id' do
    sourcetext_by_id.delete
    status 200
  end

end