Rails.application.routes.draw do
   
  
   resources :stores

  devise_for :admins, path: 'admins'
  devise_for :sellers, path: 'sellers'
  devise_for :customers, path: 'customers'
  
  root to: 'stores#index'
  
  resources :stores
  resources :dashboard
  resources :customer_addresses
  


