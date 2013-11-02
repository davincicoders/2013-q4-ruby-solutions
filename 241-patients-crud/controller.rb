require './davinci-sinatra.rb'

get "/" do
  @patients = Patient.order(:id)
  halt erb(:index)
end

get "/patients/:id" do
  id       = params["id"]
  @patient = Patient.find(id)
  halt erb(:edit_or_new)
end

post "/patients/:id" do
  id                 = params["id"]
  @patient           = Patient.find(id)
  if params["commit"] == "Update"
    @patient.systolic  = params["systolic"]
    @patient.diastolic = params["diastolic"]
    if @patient.save == true
      redirect "/patients/#{id}"
    else
      halt erb(:edit_or_new)
    end
  elsif params["commit"] == "Delete"
    @patient.destroy
    redirect "/"
  end
end

get "/new_patient" do
  @patient = Patient.new
  halt erb(:edit_or_new)
end

post "/new_patient" do
  @patient = Patient.new
  @patient.systolic  = params["systolic"]
  @patient.diastolic = params["diastolic"]
  if @patient.save == true
    redirect "/"
  else
    halt erb(:edit_or_new)
  end
end
