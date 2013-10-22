require './davinci-sinatra.rb'

get "/" do
  halt erb(:index)
end

post "/" do
  m         = Message.new
  m.subject = params["subject"]
  m.body    = params["body"]
  m.save!

  redirect "/"
end
