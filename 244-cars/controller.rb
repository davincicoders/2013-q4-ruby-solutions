require './davinci-sinatra.rb'

# Setup a handler for the GET / route
get "/" do

  # Define a @cars variable with all the rows from the cars table.
  @cars = Car.order(:id)

  # Render the index.html.erb view
  halt erb(:index)

end # End handler
