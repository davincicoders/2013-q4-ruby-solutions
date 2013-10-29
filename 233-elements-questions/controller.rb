require './davinci-sinatra.rb'

get "/" do
  halt erb(:questions)
end

post "/" do
  if params[:name_of_element] != ""
    element = Element.find_by!(name: params[:name_of_element])
    @answer9 = element.number
  end
  if params[:number_of_element] != ""
    element = Element.find_by!(number: params[:number_of_element])
    @answer10 = element.name
  end
  halt erb(:answer_to_9_or_10)
end
