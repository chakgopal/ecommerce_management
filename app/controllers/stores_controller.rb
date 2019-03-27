class StoresController < ApplicationController
  
 def root
  if seller_signed_in?
    redirect_to new_stores_url
  else
    redirect_to new_seller_session_path
  end
end

 def new 
  
  @store = Store.new
  render layout: false
 end

 def create
   #render :text=>params.inspect
   @store = Store.new(store_params)

    if  @store.save
      redirect_to @store
    else
     redirect_to 'new'
    end
 end





private
    def store_params
      params.require(:store).permit(:shop_name, :company_email,:shop_intro,:address1,:shop_phone_no,:address_proff,)
    end
end