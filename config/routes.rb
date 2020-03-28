Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Profiles routes
  post "/profile/create" => "profiles#create"
  get "/profiles" => "profiles#list"
  put "/profile/:id" => "profiles#update"
  get "/profile/:id" => "profiles#show"

  # Users routes
  post "/user/create" => "users#create"
  get "/users" => "users#list"
  put "/user/:id" => "users#update"
  put "/user/disable/:id" => "users#disable"
  put "/user/enable/:id" => "users#enable"
  post "/user/login" => "users#login"
  get "/user/:id" => "users#show"
  get "/user/requests/:id" => "users#requests"

  # Requests routes
  post "/request/create" => "requests#create"
  get "/profiles" => "profiles#list"
  put "/profile/:id" => "profiles#update"
  get "/profile/:id" => "profiles#show"


  # Errors
  get "/404" => "errors#not_found"
  get "/500" => "errors#exception"
end
