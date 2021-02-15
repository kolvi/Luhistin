class LuhistinServer < Sinatra::Base

  def read_bodypars
    JSON.parse(request.body.read, symbolize_names: true)
  end

  def source_name
    read_bodypars[:name]
  end

  def source_text
    Sourcetext[name: source_name]
  end

  def sources_success
    status 200
  #  { sources: sources_with_empty_content}.to_json
  end

  get '/hello' do
    "Well hello!"
  end

  get 'sourcetexts' do
  end

  post '/sourcetexts/rename' do
    bodypars = read_bodypars
    # TODO: Error handling
    Sourcetext[name: bodypars[:name]].set(name: bodypars[:new_name]).save
    sources_success
  end

  delete '/sourcetexts/:id' do
    # TODO: Error handling
    source_text.delete
    sources_success
  end

  post '/sourcetexts/:id' do
    # TODO: Error handling
    Sourcetext.insert(name: source_name, content: '')
    sources_success
    # TODO: Add method for changing
    # parameters of source text
  end

  patch '/sourcetexts/:id' do
    # TODO: Add method for changing
    # parameters of source text
  end

=begin
  post '/sourcetexts/create' do
    # TODO: Error handling
    Sourcetext.insert(name: source_name, content: '')
    sources_success
  end
=end
  post '/sourcetexts/text_content' do
    # TODO: Error handling
    sname = source_name
    text_content = Sourcetext[name: sname][:content]
    status 200
    {
      name: sname,
      text_content: text_content
    }.to_json
  end

  post '/sourcetexts/text_content/save' do
    # TODO: Error handling
    bodypars = read_bodypars
    Sourcetext[name: bodypars[:name]].set(content: bodypars[:text_content]).save
    status 200
  end

end