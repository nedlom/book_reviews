Rails.application.routes.draw do

  resources :reviews
  root "sessions#welcome"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  delete "/logout", to: "sessions#destroy"

  resources :users
  resources :genres
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
