require './davinci-sinatra.rb'

# Setup handler for GET / route
get "/" do

  # Load all rows from the members table, sorted by name alphabetically
  @members = Member.order(:name)

  # Render views/index.html.erb
  halt erb(:index)

end # End handler
