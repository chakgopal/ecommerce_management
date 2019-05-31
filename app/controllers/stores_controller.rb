class StoresController < ApplicationController
  
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
    if @store.save
      #render :plain => "Store registration successfull"
      redirect_to new_product_url
    else
      redirect_to 'new'
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
    @store = Store.find(params[:id])
    puts  @store.shop_name
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to @store, notice: 'Store was successfully updated.' }
        format.json { render :show, status: :ok, location: @store }
      else
        format.html { render :edit }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
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
    params.require(:store).permit(:shop_name, :company_email, :shop_intro, :address1, :address2, :alternative_phone_no1, :shop_phone_no, :gst_image, :shop_pan_image, :trade_license_image, :iso_image, :certificate_image, :address_proff_image, :trade_mark_image, :landmark, :seller_id, images:[])
  end
  
  def set_store
      @store = Store.find(params[:id])
  end
end
