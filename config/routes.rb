Rails.application.routes.draw do

  root "sessions#welcome"
  resources :users
  resources :genres
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
