Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers, controllers: { registrations: 'customers/registrations' }
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
      
    end
    member do
     delete :remove_item_from_cart
    end  
  end
  resources :quote_items
  resources :inventory_stocks
  
  root to: 'products#index'
end