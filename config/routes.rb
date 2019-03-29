Rails.application.routes.draw do
   
   	 devise_for :admins, path:'/admin/admins', path_names: {sign_up: 'register', sign_in: 'login', sign_out: 'logout'} 
 

  

  root to: 'stores#root'

  devise_for :sellers , path:'/seller/sellers', path_names: {sign_up: 'register', sign_in: 'login', sign_out: 'logout'}
  resources :stores
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end

