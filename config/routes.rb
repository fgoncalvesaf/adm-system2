Rails.application.routes.draw do
  resources :requests
  resources :users
  resources :stocks
  resources :installments
  resources :discounts
  resources :sales
  resources :items
  resources :products
  resources :addresses
  resources :clients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
