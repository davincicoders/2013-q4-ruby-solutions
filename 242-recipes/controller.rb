require './davinci-sinatra.rb'

get "/" do
  @recipes = Recipe.order(:id).all
  @title = "All recipes"
  halt erb(:index)
end

get "/recipe/:name" do
  name = params["name"]
  @recipe = Recipe.find_by(name: name)
  halt erb(:show)
end

get "/by-author/:name" do
  name = params["name"]
  author = Author.find_by(full_name: name)
  @recipes = Recipe.where(author_id: author.id)
  @title = "Recipes by #{author.full_name}"
  halt erb(:index)
end
