class StoresController < ApplicationController
  
 

 def new 
  @store = Store.new
  render layout: false
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





private
    def store_params
      params.require(:store).permit(:shop_name, :company_email,:shop_intro,:address1,:shop_phone_no,:address_proff)
    end
end
