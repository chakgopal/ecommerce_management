Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  devise_for :sellers

  resources :customer_addresses
  resources :customers
  resources :dashboard
  resources :order_addresses
  resources :order_items
  resources :orders
  resources :products
  resources :sellers
  resources :stores

  root to: 'products#index'
end
