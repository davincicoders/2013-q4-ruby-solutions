require './davinci-sinatra.rb'



# Setup handler for GET / route
get "/" do

  # Query teams table for all rows, sorted alphabetically by name
  @teams = Team.order(:name)

  # Render index.html.erb view
  halt erb(:index)

end # End handler


# Setup handler for route matching URL paths like /teams/Bears
get "/teams/:name" do

  # What team name was in the URL path?  Save it to the name variable.
  name = params["name"]

  # Load the row from the teams table that has the same name as
  # what was in the URL path.
  @team = Team.find_by(name: name)

  # Render the show.html.erb view
  halt erb(:show)

end # End handler
