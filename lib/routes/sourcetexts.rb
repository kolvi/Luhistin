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
    halt 400 unless (params[:id].to_i.to_s == params[:id])
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

  def model_for(routename)
    Object.const_get(routename.capitalize)
  end

  ["sourcetext", "recipe"].each do |item|
    model = Object.const_get(item.capitalize)
#    model = model_for(item)

    get "/#{item}" do
      success_with_all model
    end

    get "/#{item}/:id" do
      success_with entity_by_id(model)
    end

    post "/#{item}" do
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
      entity_by_id(model).delete
      status 204
    end

  end


end