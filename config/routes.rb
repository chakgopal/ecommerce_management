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
  resources :quotes
  resources :quote_items
<<<<<<< HEAD
=======
    

>>>>>>> a8dbe27d62b96fba14853a70f7d7030730367eb9

  root to: 'products#index'
end