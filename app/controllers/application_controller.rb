class ApplicationController < ActionController::Base
 protect_from_forgery with: :exception

 before_action :configure_permitted_parameters, if: :devise_controller?

 def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:role,:firstname,:lastname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name,:role,:firstname,:lastname])
 end

 def root
  if admin_signed_in?
    puts "coca-cola"
    render "admin/index"
  else
    redirect_to new_admin_session_path
  end

end

end
