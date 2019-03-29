Rails.application.routes.draw do

  root to: 'admin#index'
  devise_for :admins, path:'', path_names: {sign_up: 'register', sign_in: 'login', sign_out: 'logout'} 
  
  devise_for :sellers , path:'', path_names: {sign_up: 'register', sign_in: 'login', sign_out: 'logout'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end

