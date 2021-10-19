Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'items#index'
  # resources :items do
  #   resources :votes
  # end
  resources :items 
  resources :orders
  resources :votes
  get "/users/:id", to: "users#show"
  get "/users/:id/edit", to: "users#edit"
  patch "/users/:id/edit" , to: "users#update"
  
end