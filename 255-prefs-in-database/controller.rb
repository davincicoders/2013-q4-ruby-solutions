require './davinci-sinatra.rb'

get "/" do
  # If there is already a user_id saved in the session...
  if session[:user_id] != nil
    # ...then use it to load the @user instance variable.
    @user = User.find(session[:user_id])
  else # Otherwise...
    # ...just start a new empty User.
    @user = User.new
  end

  halt erb(:index)
end

post "/" do
  # If there is already a user_id saved in the session...
  if session[:user_id] != nil
    # ...then use it to set the @user variable.
    @user = User.find(session[:user_id])
  else # Otherwise...
    # ...just start a new empty User.
    @user = User.new
  end

  # Set the user's new preferences from POST params to the User object
  @user.color  = params["color"]
  @user.number = params["number"]
  @user.letter = params["letter"]

  # Save the User object
  @user.save!

  # Save that user ID to the session, in case we created a new one.
  # (If we already had a user ID in the session, it doesn't hurt to
  # overwrite it with the same value).
  session[:user_id] = @user.id

  redirect "/"
end

get "/logout" do
  session.clear
  redirect "/"
end
