require "./davinci-sinatra.rb"

get "/" do
  @apartments = Apartment.all
  halt erb(:index)
end

get "/delete_apartment/:id" do
  halt erb(:confirm)
end

post "/delete_apartment/:id" do
  if params["commit"] == "OK"
    id = params["id"]
    a = Apartment.find(id)
    a.destroy
    redirect "/"
  elsif params["commit"] == "Cancel"
    redirect "/"
  end
end
