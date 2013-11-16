App::Application.routes.draw do
  get  "/"             => "main#root"
  get  "/login"        => "main#login_get"
  post "/login"        => "main#login_post"
  get  "/reservations" => "main#reservations_get"
  post "/reservations" => "main#reservations_post"
end
