App::Application.routes.draw do
  get  "/"          => "main#root"
  get  "/new_goat"  => "main#new_goat_get"
  post "/new_goat"  => "main#new_goat_post"
  get  "/goats/:id" => "main#add_edit_get"
  post "/goats/:id" => "main#add_edit_post"
end
