require './davinci-sinatra.rb'

get "/" do
  halt erb(:login)
end

post "/" do
  username = params["username"]
  pin      = params["pin_number"]
  user     = User.find_by(username: username)
  if user == nil
    @error = "Unknown username"
    @old_username = username
    halt erb(:login)
  elsif user.pin_number != pin
    @error = "Wrong pin number"
    @old_username = username
    halt erb(:login)
  else
    redirect "/success"
  end
end

get "/success" do
  halt erb(:success)
end
