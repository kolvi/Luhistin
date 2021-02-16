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

#  def sourcetext_by_id
#    Sourcetext[params[:id]] || (halt 404)
#  end

  def entity_by_id(model_class)
#    halt 404 unless params[:id].is_a? Integer
    model_class[params[:id]] || (halt 404)
  end

  def success_with(entity, http_code: 200)
    status http_code
    entity.values.to_json
  end

  def success_with_all(model_class)
    status 200
    model_class.all.map(&:values).to_json
  end

  def model_class(routename)
    Object.const_get(routename.capitalize)
  end

  def process_recipe_params(provided)
    processed = {}
    if provided[:name]
      processed[:name] = provided[:name]
    end
    if (provided[:distortions])
      processed[:distortions] = provided[:distortions].map do |row|
        DB.row_type(:distortion, [row[:name], row[:intensity].pg_array] )
      end.pg_array
    end
    processed
  end


  ["sourcetext", "recipe"].each do |item|

    get "/#{item}" do
      success_with_all(model_class item)
    end

    get "/#{item}/:id" do
      success_with entity_by_id(model_class item)
    end

    post "/#{item}" do
      model = model_class(item)
      body_params = read_columns_of(model)
      begin
        if (item == "recipe")
          entity = model.create(process_recipe_params body_params)
        else
          entity = model.create(body_params)
        end
      rescue Sequel::Error
        halt 400
      end
      success_with(entity, http_code: 201)
    end

    patch "/#{item}/:id" do
      model = model_class(item)
      begin
         body_params = read_columns_of(model)
         keyz = body_params.keys
         paramz = body_params
         paramz = process_recipe_params(paramz) if (item == "recipe")
         entity_by_id(model).set_fields(paramz, keyz).save
      rescue Sequel::Error
         halt 400
      end
       success_with( model[params[:id]] )
    end

    delete "/#{item}/:id" do
      entity_by_id(model_class item).delete
      status 204
    end

  end



#  get '/sourcetext/:id' do
#    #success_with sourcetext_by_id 
#    success_with entity_by_id(Sourcetext) 
#  end

#  get '/sourcetext' do
#    success_with_all(Sourcetext)
#  end

#  post '/sourcetext' do
#    body_params = read_columns_of(Sourcetext)
#    begin
#      entity = Sourcetext.create(body_params)
#    rescue Sequel::Error
#      halt 400
#    end
#    success_with(entity, http_code: 201)
#  end

#  patch '/sourcetext/:id' do
#    begin
#       body_params = read_columns_of(Sourcetext)
#       #sourcetext_by_id.set_fields(body_params, body_params.keys).save
 #      entity_by_id(Sourcetext).set_fields(body_params, body_params.keys).save

#    rescue Sequel::Error
#       halt 400
#    end
 #    success_with( Sourcetext[params[:id]] )
#  end

#  delete '/sourcetext/:id' do
#    entity_by_id(Sourcetext).delete
#    #sourcetext_by_id.delete
#    status 204
#  end

end