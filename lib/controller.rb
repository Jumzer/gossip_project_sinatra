require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end
  get '/gossips/new/' do
    erb :new_gossip
  end
  post '/gossips/new/' do
    Gossip.new(params["gossip_author"],params["gossip_content"]).save
    redirect '/'
  end
  get '/gossips/:id/' do
    # matches "GET /hello/foo" and "GET /hello/bar"
    # params['name'] is 'foo' or 'bar'
    g = Gossip.find(params['id'].to_i)
    puts g.inspect
    erb :show, locals: {gossip: g, id: params['id'].to_i} # fait appel à la méca de routage, 
  end
end