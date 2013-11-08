require './davinci-sinatra.rb'



# Setup handler for the GET / route
get "/" do

  # Set @players variable to all the rows in players, sorted by name.
  @players = Player.order(:name)

  # Render the index.html.erb view
  halt erb(:index)

end # End handler



# Setup handler matching URL paths like /players/2
get "/players/:id" do

  # What came after /players/ in the URL path?  Save it to the id
  # variable.
  id = params["id"]

  # Look up the row in players with an id that matches whatever was
  # saved to the id variable.
  @player = Player.find(id)

  # Render the show.html.erb view
  halt erb(:show)

end # End handler
