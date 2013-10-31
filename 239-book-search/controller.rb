require './davinci-sinatra.rb'

get "/" do
  halt erb(:browse)
end

get "/year/:year" do
  year    = params["year"]
  @books  = Book.where(publication_year: year)
  @header = "Books published in #{year}"
  halt erb(:search_results)
end

get "/author/:last_name" do
  last_name = params["last_name"]
  @books    = Book.where("author ilike ?", "%#{last_name}")
  @header   = "Books by #{last_name}"
  halt erb(:search_results)
end

get "/topic/:topic" do
  topic   = params["topic"]
  @books  = Book.where("title ilike ?", "%#{topic}%")
  @header = "Books about #{topic}"
  halt erb(:search_results)
end

get "/isbn/:isbn" do
  isbn  = params["isbn"]
  @book = Book.find_by(isbn: isbn)
  halt erb(:show)
end
