require './davinci-sinatra.rb'

get "/" do
  halt erb(:index)
end

post "/" do
  quote = Quote.new
  quote.text = params["new_quote"]
  quote.author = params["new_author"]
  quote.save!

  redirect "/"
end
