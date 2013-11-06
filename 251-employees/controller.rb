require './davinci-sinatra.rb'

get "/" do
  @employees = Employee.order(:id)
  @new_employee = Employee.new
  halt erb(:index)
end

post "/" do
  @new_employee = Employee.new
  @new_employee.first_name = params["first_name"]
  @new_employee.last_name  = params["last_name"]
  @new_employee.company_id = params["company_id"]
  if @new_employee.save == true
    redirect "/"
  else
    @employees = Employee.order(:id)
    halt erb(:index)
  end
end
