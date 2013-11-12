require './davinci-sinatra.rb'

# Users always expect a route at / so redirect them to where we want
get "/" do
  redirect "/login"
end

# Setup GET route for registration form
get "/users/new" do

  # Define @user so new.html.erb view can use it to pre-fill in blanks
  @user = User.new

  halt erb(:new)
end

# Setup POST route for handling registration form entries
post "/users/new" do

  # Set fields on the User object corresponding to the values that
  # the user filled out.  The password and password_confirmation
  # fields won't be accessible after this handler ends; they're
  # "write-only," in that their values are thrown away forever.
  @user = User.new
  @user.username = params["username"]
  @user.password = params["password"]
  @user.password_confirmation = params["password_confirmation"]

  # If validations succeed, redirect, otherwise show the page again.
  if @user.save == true
    redirect "/login"
  else
    halt erb(:new)
  end
end

# Setup GET route for login form
get "/login" do
  halt erb(:login)
end

# Setup POST route to handle login form entries
post "/login" do
  # Look for the user row matching the username that the user entered
  named_user = User.find_by(username: params["username"])

  if named_user == nil
    @message = "Unknown username"
    halt erb(:login)
  elsif named_user.authenticate(params["password"]) == false
    @message = "Wrong password"
    halt erb(:login)
  else
    session[:user_id] = named_user.id
    redirect "/welcome"
  end
end

# An example page that's accessible only after you're logged in
get "/welcome" do
  # Get the user_id out of the session
  user_id = session[:user_id]

  # Look up the user row with that id
  @user = User.find(user_id)

  halt erb(:welcome)
end

get "/logout" do
  session.clear
  redirect "/login"
end
