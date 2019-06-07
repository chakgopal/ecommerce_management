class StoresController < ApplicationController

  include Verify
  
  #before_action :authenticate_admin!, only: [:index]
  before_action :authenticate_seller!, only:[:new,:destroy,:index]
  before_action :set_store, only: [:show, :edit, :update, :destroy]

 

 def root
  if seller_signed_in?

    redirect_to new_store_url
  else
    redirect_to new_seller_session_path
  end
end


 #def new 
  #@store = Store.new
  # render layout: false
 #end
 def new
  if current_seller 
   @store = Store.new

  else
   redirect_to new_seller_session_path
  end
 end

 def create
   #render :text=>params.inspect
   logger.info current_seller.inspect
   @store = Store.new(store_params.merge(seller_id: current_seller.id))
    
      #render :plain => "Store registration successfull"
    if valid_phone_number?(store_params['countrycode'], store_params['shop_phone_no'])
      @store.save
      redirect_to @store , notice: 'You have a valid phone number!'
    else
      flash.alert = 'Please enter a valid phone number'
      render :new
    end
 end

  def index

    if seller_signed_in?
    
     @stores = Store.with_attached_images.where(seller_id: current_seller.id ).order(:id)
     @paginatable_array = Kaminari.paginate_array(@stores).page(params[:page]).per(10)
    end
     
     #@stores = Store.where(seller_id: current_seller.id)
     

     @stores = Store.where(seller_id: current_seller.id )

  end

  def edit
     @store = Store.find(params[:id])
     puts @store.shop_name
  end 

  def update
    if  valid_confirmation_code?(params['code'], @store.countrycode, @store.shop_phone_no)
      @store.update(verified: true)
      redirect_to @store, notice: "#{@store.shop_phone_no} has been verified!"
    else
      redirect_to @store, alert: 'invalid or expired token'
    end
  end



  def show
    @store = Store.find(params[:id])
      puts  @store.shop_name
  end

  

def destroy
    @store.update(status:'inactive')

    respond_to do |format|
      format.html { redirect_to stores_url, notice: 'Store was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private
  def store_params
    params.require(:store).permit(:shop_name, :company_email, :shop_intro, :address1, :address2, :alternative_phone_no1, :shop_phone_no, :gst_image, :shop_pan_image, :trade_license_image, :iso_image, :certificate_image, :address_proff_image, :trade_mark_image, :landmark, :seller_id, :countrycode, images:[])
  end
  
  def set_store
      @store = Store.find(params[:id])
  end
end
