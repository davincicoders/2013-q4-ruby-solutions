App::Application.routes.draw do
  get "/" => redirect("/users")

  resources :users, only: ["index", "new", "create"]
  post "/users/login"  => "users#login",  as: "login"
  post "/users/logout" => "users#logout", as: "logout"

  get "/verify_email/:user_id/:token" => "users#verify_email",
    as: "verify_email"
  post "/resend_verification_email" => "users#resend_verification_email",
    as: "resend_verification_email"

  get  "/users/forgot_password" => "users#forgot_password",
    as: "forgot_password"
  post "/users/forgot_password" => "users#forgot_password_post",
    as: "forgot_password_post"
  get  "/users/reset_password/:user_id/:token" => "users#reset_password",
    as: "reset_password"
  post "/users/reset_password" => "users#reset_password_post",
    as: "reset_password_post"
end
