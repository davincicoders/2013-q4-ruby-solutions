require './davinci-sinatra.rb'

get "/" do
  redirect "/login"
end

get "/login" do
  # There's no error to show; not necessary, just being clear...
  @error = nil

  halt erb(:login)
end

post "/login" do
  # Load the values that user filled out for the username and password
  # into variables.
  username = params["username"]
  password = params["password"]

  # Look for a row in the users table with that same username
  found_user = User.find_by(username: username)

  # If no row was found for that username...
  if found_user == nil
    # Then set a message to show at the top of the page after the redirect
    flash[:error] = "Unknown username"

    # And redirect back to login (instead of rendering)
    redirect "/login"

  # Otherwise, if the password was wrong...
  elsif found_user.authenticate(password) == false
    # Then set a message to show at the top of the page after the redirect
    flash[:error] = "Incorrect password"

    # And render the login page again
    redirect "/login"

  # Otherwise... (if the username and password was right)
  else
    # Save that user's id into the session so we'll have it later
    session[:user_id] = found_user.id

    # Set a message to show at the top of the page after the redirect
    flash[:success] = "You have successfully logged in."

    # Redirect to the default page
    redirect "/welcome"
  end # End if
end # End handler

get "/welcome" do
  # Load the user_id from the session
  user_id = session[:user_id]
  # Load the user based on that id saved to the session
  @user = User.find(user_id)
  halt erb(:welcome)
end

get "/logout" do
  # Remove the user id from the session and everything else
  session.clear

  # Set a message to show at the top of the page after the redirect
  # (Must be done after the session.clear or else it will get thrown out)
  flash[:success] = "You have successfully logged out."

  redirect "/login"
end
