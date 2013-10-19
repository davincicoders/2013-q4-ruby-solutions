require './davinci-sinatra.rb'

get "/" do
  halt erb(:index)
end

get "/cities/:id" do
  id = params[:id]
  @city = UsCity.find(id)
  halt erb(:show)
end
