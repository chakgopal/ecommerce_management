Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers, controllers: { confirmations: 'confirmations' }
  devise_for :sellers

  resources :customer_addresses
  resources :customers
  resources :dashboard
  resources :order_addresses
  resources :order_items
  resources :orders do
    collection do
      get :checkout
      get :order_price
      post :place_order
<<<<<<< HEAD
      get :check_orders
=======
      get :order_history
>>>>>>> fd74ded663917e2068024f3adc91e22a5a0d436f
    end
  end  
  resources :products do
    member do
      get :send_email
    end
  end
  resources :sellers
  resources :stores
  resources :quotes do
    collection do
      get :new_quote
      get :show_cart
      get :place_order_for_cart_items
    end
    member do
     delete :remove_item_from_cart
    end  
  end
  resources :quote_items
  resources :inventory_stocks
  
  root to: 'products#index'
end