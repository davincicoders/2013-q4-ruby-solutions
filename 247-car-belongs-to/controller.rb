require './davinci-sinatra.rb'



# Setup handler for GET / route
get "/" do

  # Load all the cars rows, sorted by id
  @cars = Car.order(:id)

  # Render the index.html.erb view
  halt erb(:index)

end # End handler
