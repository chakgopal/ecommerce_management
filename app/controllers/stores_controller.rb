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
  if current_seller 
   @store = Store.new
  else
   redirect_to new_seller_session_path
  end
 end

 def create
   #render :text=>params.inspect
   @store = Store.new(store_params.merge(seller_id:  current_seller.id))
    if  @store.save
      render :plain => "Store registration successfull"
      #redirect_to store_path
    else
      redirect_to 'new'
    end
 end

 def index
  @current_seller=current_seller
  @stores = Store.joins(:seller)
  #puts @stores.to_json
 end





private
 def store_params
                   params.require(:store).permit(:shop_name, :company_email,:shop_intro,:address1,:shop_phone_no,:address_proff,:gst_image,:shop_pan_image,:trade_license_image,:iso_image,:certificate_of_incorporation,:trademark_registration,shop_images:[])
 end
end
