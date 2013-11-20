App::Application.routes.draw do
  get  "/" => "main#index"
  post "/" => "main#place_order"
end
