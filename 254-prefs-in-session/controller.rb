require './davinci-sinatra.rb'

get "/" do
  # Retrieve three values stored in the session and save them as
  # instance variables.
  @color  = session[:color]
  @number = session[:number]
  @letter = session[:letter]

  halt erb(:index)
end

post "/" do
  # Retrieve values of POST params and keep them as local variables.
  color  = params["color"]
  number = params["number"]
  letter = params["letter"]

  # Save those local variables to the session so the values will last.
  session[:color]  = color
  session[:number] = number
  session[:letter] = letter

  redirect "/"
end

get "/logout" do
  session.clear
  redirect "/"
end
