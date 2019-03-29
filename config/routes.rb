Rails.application.routes.draw do

  resources :dashboard
  resources :customer_addresses
  
  devise_for :customers
  root to: 'dashboard#new'

  devise_for :sellers , path:'', path_names: {sign_up: 'register', sign_in: 'login', sign_out: 'logout'}
  resources :stores
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
