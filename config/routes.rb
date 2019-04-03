Rails.application.routes.draw do

  devise_for :admins, path: 'admins'
  devise_for :sellers, path: 'sellers'
  devise_for :customers, path: 'customers', :controllers => { registrations: 'registrations'}
  
  root to: 'dashboard#new'
  
  resources :stores
  resources :dashboard
  resources :customer_addresses
  
end

