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
      get :order_history
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
      get :quantity_of_cart_items
      get :items_in_cart_with_quantity
      post :checkout_for_cart_item
    end
    member do
     delete :remove_item_from_cart
    end  
  end
  resources :quote_items
  resources :inventory_stocks
  
  root to: 'products#index'
end