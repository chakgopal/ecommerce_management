Rails.application.routes.draw do
   
  
 

  devise_for :admins, path: 'admins' 
  devise_for :sellers, path: 'sellers'
  devise_for :customers, path: 'customers'
  
  root to: 'stores#index'
  
  resources :stores
  resources :dashboard
  resources :customer_addresses
  get "seller_index", to: "admin#seller_index"
  get "customer_index", to: "admin#customer_index"
  
end

