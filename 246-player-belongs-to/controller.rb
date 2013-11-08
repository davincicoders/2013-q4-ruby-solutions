require './davinci-sinatra.rb'



# Setup handler for GET / route
get "/" do

  # Load all the players rows, sorted alphabetically by name
  @players = Player.order(:name)

  # Render the index.html.erb view
  halt erb(:index)

end # End handler



# Setup handler for a route matching URL paths like /players/2
get "/players/:id" do

  # What came after /players/ in the URL path?  Save it as id variable.
  id = params["id"]

  # Load the players row with an id matching what's in the id variable.
  @player = Player.find(id)

  # Render the index.html.erb view
  halt erb(:show)

end # End handler
