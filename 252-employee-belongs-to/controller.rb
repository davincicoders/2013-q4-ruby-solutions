require './davinci-sinatra.rb'



# Setup handler for GET / route
get "/" do

  # Retrieve all records from employees table, sorted by id
  @employees = Employee.order(:id)

  # Create an empty Employee object, so that we can prefill from it
  @new_employee = Employee.new

  # Render index.html.erb view
  halt erb(:index)

end # End GET handler



# Setup handler for POST / route
post "/" do

  # Start an empty Employee object
  @new_employee = Employee.new

  # Set its first_name to whatever the user entered
  @new_employee.first_name = params["first_name"]

  # Set its last_name to whatever the user entered
  @new_employee.last_name  = params["last_name"]

  # Set its company_id to whatever the user entered
  @new_employee.company_id = params["company_id"]

  # Attempt to save; check if the save succeeded
  if @new_employee.save == true

    # Redirect back to the GET / route
    redirect "/"

  else # If the save failed because validations failed

    # Retrieve all records from employees table, because
    # the view needs this variable set.
    @employees = Employee.order(:id)

    # Render index.html.erb view (note that @new_employee has
    # been set, so text fields can be pre-filled)
    halt erb(:index)

  end # End if

end # End POST handler
