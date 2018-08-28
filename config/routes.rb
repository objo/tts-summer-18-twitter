Rails.application.routes.draw do
  devise_for :users
  root "timeline#index"
  get "/timeline" => "timeline#index", as: :timeline
  get "/users" => "users#index", as: :users
  get "/users/:id" => "users#show", as: :user
  get "/follow/:id" => "users#follow", as: :follow_user

  resources :messages
end
