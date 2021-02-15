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
    # Validate:
    # 1. Are all columns actually columns of said class?
    # 2. Is id included? (Shouldn't be!)
    available_keys = model_class.columns-[:id]
    halt 400 unless (parameter_hash.keys - available_keys).empty?
  end

  get '/sourcetext/:id' do
    stext = sourcetext_by_id
    status 200
    stext.values.to_json
  end

  post '/sourcetext' do
    body_params = read_bodypars
    ensure_parameters_are_keys_for Sourcetext, body_params
    begin
      new_id = Sourcetext.insert body_params
    rescue Sequel::Error
      halt 400
    end
    status 200
    Sourcetext[new_id].values.to_json
  end


  patch '/sourcetext/:id' do
    begin
       stext = sourcetext_by_id
       body_params = read_bodypars

       ensure_parameters_are_keys_for Sourcetext, body_params

       # Set all keys
       stext.set_fields(body_params, body_params.keys).save

    #  was [Sequel::DatabaseError, Sequel::ConstraintViolation, Sequel::ValidationFailed, JSON::ParserError]
    #rescue *[Sequel::Error, JSON::ParserError]
    rescue Sequel::Error
       halt 400
    end
     status 200
     stext.values.to_json
  end

  delete '/sourcetext/:id' do
    sourcetext_by_id.delete
    status 200
  end

end