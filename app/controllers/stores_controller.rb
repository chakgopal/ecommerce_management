class StoresController < ApplicationController
  
 def root
  if seller_signed_in?
    puts "coca cola"
    redirect_to new_store_url
  else
    redirect_to new_seller_session_path
  end
end

 def new 
  @store = Store.new
  # render layout: false
 end

 def create
   #render :text=>params.inspect
   @store = Store.new(store_params)
    if  @store.save
      render :plain => "Store registration successfull"
      #redirect_to store_path
    else
      redirect_to 'new'
    end
 end

 def index
  @stores = Store.all
 end





private
    def store_params
      params.require(:store).permit(:shop_name, :company_email,:shop_intro,:address1,:shop_phone_no,:address_proff)
    end
end
