Rails.application.routes.draw do
  
  devise_for :users
  get 'say/hello'
  get 'say/goodbye'
  root 'categories#index'
  #only for models we can use "resources", which finds all actions for the given controller
  resources :categories
  resources :products
  resources :reviews
  resources :cart_line_items
  resources :addresses
  resources :wishlists
  resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
