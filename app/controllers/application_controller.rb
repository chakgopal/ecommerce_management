class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:firstname,:lastname])
  end

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


