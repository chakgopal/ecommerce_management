Rails.application.routes.draw do

  devise_for :admins, path: 'admins'
  devise_for :sellers, path: 'sellers'
  
  root to: 'stores#index'
  
  resources :stores
  
end

