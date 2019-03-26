Rails.application.routes.draw do
  resources :customer_addresses
  devise_for :customers
  root to: 'customer_addresses#new'
  devise_for :sellers , path:'', path_names: {sign_up: 'register', sign_in: 'login', sign_out: 'logout'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
