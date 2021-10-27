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
  resources :votes

  resources :total_orders, :only => [:create, :show, :destroy]
  get "/total_orders/:item_id/new", to: "total_orders#new"
  # get "/users/:user/_id/orders/new", to: "orders#new"
  get "/users/:id", to: "users#show"
  get "/users/:id/edit", to: "users#edit"
  patch "/users/:id/edit" , to: "users#update"
  # get "/total_orders/new", to: "total_orders#new"
  get "/recommend", to: "items#recommend"  
  get "/new_item", to:"items#new_item"
end