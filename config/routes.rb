Rails.application.routes.draw do
  root "sessions#welcome"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  delete "/logout", to: "sessions#destroy"

  # get '/auth/:provider/callback' => 'sessions#omniauth'
  #match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

  get '/auth/:provider/callback' => 'sessions#create'

  resources :users
  resources :genres
  resources :books do
    resources :reviews, only: [:new, :index]
  end
  resources :reviews
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
