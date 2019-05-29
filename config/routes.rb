Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  devise_for :sellers

  resources :customer_addresses
  resources :customers
  resources :dashboard
  resources :order_addresses
  resources :order_items
  resources :orders do
    collection do
      get :checkout
    end
  end  
  resources :products
  resources :sellers
  resources :stores
  resources :quotes do
    collection do
      get :new_quote
      get :show_cart
    end
  end
  resources :quote_items
  resources :inventory_stocks
  
  root to: 'products#index'
end