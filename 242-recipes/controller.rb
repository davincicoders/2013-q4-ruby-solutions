require './davinci-sinatra.rb'



# Setup handler for GET / route
get "/" do

  # Load all rows from the recipes table, sorted by their id.
  @recipes = Recipe.order(:id)

  # Header at the top of this page needs to be set.
  @title = "All recipes"

  # Render the index.html.erb view
  halt erb(:index)

end # End handler



# Setup a handler to match URL paths like /recipe/Brownies
get "/recipe/:name" do

  # What came after /recipe/ in the URL path?  Assign it to the name
  # variable.
  name = params["name"]

  # Load the recipes row that has a name matching what's in the name
  # variable.
  @recipe = Recipe.find_by(name: name)

  # Render the show.html.erb view
  halt erb(:show)

end # End handler



# Setup a handler to match URL paths like /by-author/Jim
get "/by-author/:name" do

  # What was after /by-author/ in the URL path?  Assign it to the
  # name variable.
  name = params["name"]

  # Find the row in authors with a first_name matching what we saved
  # to the name variable.
  author = Author.find_by(first_name: name)

  # The index.html.erb view requires @recipes to be set so it knows
  # what to show.  We don't want to show all recipes, just the ones
  # that this particular author wrote.  That requires querying the
  # recipes table for only rows where the author_id is the same as
  # the id for the author whose name is in the URL path.
  @recipes = Recipe.where(author_id: author.id)

  # The index.html.erb view also expects a header at the top of the
  # page to be set.  It's a good opportunity to remind the user that
  # we're only showing certain recipes, not all of them.
  @title = "Recipes by #{author.first_name}"

  # Render the index.html.erb view
  halt erb(:index)

end # End handler
