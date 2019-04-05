class AdminController < ApplicationController
def index
	render layout: false
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
  
 def new
  respond_to do |format|
    format.js { render :partial => "form" }
  end
end
