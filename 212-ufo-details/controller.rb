require './davinci-sinatra.rb'

get "/" do
  halt erb(:index)
end

get "/sightings/:id" do
  id = params[:id]
  @sighting = UfoSighting.find(id)
  halt erb(:show)
end
