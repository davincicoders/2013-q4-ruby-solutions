require './davinci-sinatra.rb'

# Setup handler for index page at GET / route
get "/" do
  @goats = RacingGoat.all
  halt erb(:index)
end

# Setup handler for form to fill out to create a new goat
get "/new_goat" do
  # Initialize @goat, since the view needs it to pre-fill blank values.
  @goat = RacingGoat.new
  halt erb(:edit)
end

# Setup handler for when the new goat form is submitted.
post "/new_goat" do
  # Start a new goat and assign its fields from the params' values.
  @goat                    = RacingGoat.new
  @goat.name               = params["name"]
  @goat.gender             = params["gender"]
  @goat.best_100m_time     = params["best_100m_time"]
  @goat.dietary_preference = params["dietary_preference"]

  # If an attempted save succeeds...
  if @goat.save == true
    # Alert the user "record has been created" on the top of the next page.
    flash[:notice] = "Record has been created."
    # Redirect back to the index page.
    redirect "/"
  # Otherwise if the save fails...
  else
    # Show the page again with an error message for each failed validation.
    halt erb(:edit)
  end # End if validations succeeded/failed
end # End handler

# Setup handler for add/edit goat details form
get "/goats/:id" do
  # Load id variable with whatever id is in the URL path (after /goats/)
  id = params["id"]
  # Find that goat and keep it as the @goat variable
  @goat = RacingGoat.find(id)
  # Render views/edit.html.erb
  halt erb(:edit)
end

# Setup handler for submitted add/edit goat details form
post "/goats/:id" do
  # Load id variable with whatever id is in the URL path (after /goats/)
  id = params["id"]
  # Find that goat and keep it as the @goat variable
  @goat = RacingGoat.find(id)
  # If the Save button was clicked...
  if params["commit"] == "Save"
    # Set the fields on that goat
    @goat.name               = params["name"]
    @goat.gender             = params["gender"]
    @goat.best_100m_time     = params["best_100m_time"]
    @goat.dietary_preference = params["dietary_preference"]
    # If the validations pass so the save succeeds...
    if @goat.save == true
      # Tell the user on the next page that the record was updated.
      flash[:notice] = "Record has been updated."
      # And redirect back to the index page.
      redirect "/"
    else # Otherwise, if the validations and save failed...
      # Show the same form again, with a list of validation errors
      halt erb(:edit)
    end # End if validations succeeded/failed
  # Otherwise, if the Delete button was clicked...
  elsif params["commit"] == "Delete"
    # Delete that goat.
    @goat.destroy
    # Tell the user on the next page that it was deleted.
    flash[:notice] = "Record has been deleted."
    # Redirect back to the index page.
    redirect "/"
  end # End if whatever button was clicked
end # End handler
