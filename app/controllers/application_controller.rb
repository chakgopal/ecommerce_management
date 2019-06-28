class ApplicationController < ActionController::Base
  
  def after_sign_in_path_for(resource)
       
    if resource.class == Customer
      root_path
    elsif resource.class == Admin
      root_path 
    else
      root_path
    end
  end
end


