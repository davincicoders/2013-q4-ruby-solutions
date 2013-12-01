App::Application.routes.draw do
  get    "/"             => "ads#root"

  get    "/ads"          => "ads#index"

  get    "/ads/new"      => "ads#new"
  post   "/ads"          => "ads#create"

  get    "/ads/:id"      => "ads#show"

  get    "/ads/:id/edit" => "ads#edit"
  put    "/ads/:id"      => "ads#update"

  delete "/ads/:id"      => "ads#destroy"
end
