require './davinci-sinatra.rb'

get "/" do
  @cities = City.order(:id)
  halt erb(:index)
end

get "/cities/:name" do
  name  = params["name"]
  @city = City.find_by(name: name)
  halt erb(:show)
end
