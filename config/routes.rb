Rails.application.routes.draw do
  root to: 'stores#root'
  devise_for :sellers , path:'', path_names: {sign_up: 'register', sign_in: 'login', sign_out: 'logout'}
  resources :stores
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
