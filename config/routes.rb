Rails.application.routes.draw do
    resources :order_addresses
    resources :order_items
    resources :orders
    resources :products
    devise_for :admins, path: 'admins' 
    devise_for :sellers, path: 'sellers'
    devise_for :customers, path: 'customers', :controllers => { registrations: 'registrations'}
  
    resources :sellers
    root to: 'products#index'
    resources :customers
    resources :stores
    resources :dashboard
    resources :customer_addresses
    resources :products
    get "seller_index", to: "admin#seller_index"
    get "customer_index", to: "admin#customer_index"
    get "order", to: "admin#order"
    get "quote", to: "admin#quote"
    get "quote_item", to: "admin#quote_item"
    get "store_info", to: "admin#store_info"
end
