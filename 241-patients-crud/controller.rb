require './davinci-sinatra.rb'



# Setup a handler for the GET / route
get "/" do

  # Load all rows from the patients table, sorted by their id.
  @patients = Patient.order(:id)

  # Render the index.html.erb view
  halt erb(:index)

end # End handler



# Setup a handler to match URL paths like /patients/4
get "/patients/:id" do

  # Pull out whatever number was in the URL path after /patients/,
  # and save this value to the id variable.
  id       = params["id"]

  # Find the row of patients that has an id matching what we saved
  # to the id variable.
  @patient = Patient.find(id)

  # Render the edit_or_new.html.erb view
  halt erb(:edit_or_new)

end # End handler



# Setup a handler to match URL paths like /patients/4
post "/patients/:id" do

  # Pull out whatever number was in the URL path after /patients/,
  # and save this value to the id variable.
  id                 = params["id"]

  # Find the row of patients that has an id matching what we saved
  # to the id variable.
  @patient           = Patient.find(id)

  # Look up the value for the POST param named commit, which indicates
  # which button the user clicked.  If they clicked Update...
  if params["commit"] == "Update"

    # ...Then save whatever the user entered for systolic to the
    # systolic field for the patient row that we loaded.
    @patient.systolic  = params["systolic"]

    # Also save whatever the user entered for dystolic.
    @patient.diastolic = params["diastolic"]

    # Attempt to save back to the patients row.  If it succeeded...
    if @patient.save == true

      # Then take the id variable and add /patients/ in front,
      # and redirect there.
      redirect "/patients/#{id}"

    else # But if the save failed...

      # Then render the edit_or_new.html.erb view again.
      # @patient is set so the view can pre-fill the text fields,
      # so the user doesn't need to enter them again.
      halt erb(:edit_or_new)

    end # End branching

  # But if the user clicked Delete (not Update)...
  elsif params["commit"] == "Delete"

    # Then delete that row from the patients table
    @patient.destroy

    # Redirect back to the main view (index)
    redirect "/"

  end # End branching

end # End POST handler



# Setup a handler for the GET /new_patient route
get "/new_patient" do

  # Setup an empty patients row, because the edit_or_new variable
  # will need it to pre-fill fields with values, even though they're
  # all empty.
  @patient = Patient.new

  # Render the edit_or_new.html.erb view
  halt erb(:edit_or_new)

end # End handler



# Setup a handler for the POST /new_patient route
post "/new_patient" do

  # Setup an empty patients row, this time to actually save.
  @patient = Patient.new

  # Set its systolic field to whatever the user entered for that.
  @patient.systolic  = params["systolic"]

  # Set its diastolic field to whatever the user entered for that.
  @patient.diastolic = params["diastolic"]

  # Attempt to save.  If the save suceeeded...
  if @patient.save == true

    # Then redirect back to the index page.
    redirect "/"

  # But if the save didn't succeed (because the validations failed)...
  else

    # Then render the edit_or_new.html.erb view again.  The @patient
    # variable will supply the values to pre-fill text fields with.
    halt erb(:edit_or_new)

  end # End branching

end # End handler
