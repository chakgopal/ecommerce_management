class StoresController < ApplicationController
  

 

 def root
  if seller_signed_in?

    redirect_to new_store_url
  else
    redirect_to new_seller_session_path
  end
end


 def new 
  @store = Store.new
  # render layout: false
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
   logger.info current_seller.inspect
   @store = Store.new(store_params.merge(seller_id: current_seller.id))
    if @store.save
      render :plain => "Store registration successfull"
      #redirect_to store_path
    else
      redirect_to 'new'
    end
 end

  def index
     @stores = Store.where(seller_id: current_seller.id)
  end




private
 def store_params
    params.require(:store).permit(:shop_name,:company_email,:shop_intro,:address1,:shop_phone_no,:address_proff,:gst_image,:shop_pan_image,:trade_license_image,:iso_image,:certificate_of_incorporation,:trademark_registration,:shop_image, :seller_id)
 end
end
<p>
  <strong>Quantity:</strong>
  <%= select_tag "quantity_id", options_for_select((1..100).map{ |i| [i, i]}), class: 'form-control' %> 
</p>
def new
  
      if customer_signed_in?
        current_customer_id = current_customer.id
        quotes_count = Quotes.where(customer_id: current_customer_id).count
        if count == 0
          @quote =Quote.new
        end
      else
        redirect_to new_customer_session
      end    
  end 


  <script>
    var product_name = @product.name;
    var product_id = @product.id;
    var product_price = @product.price;
    var product_status = @product.status;
    var product_short_desc = @product.short_desc;
    var product_long_desc = @product.long_desc;
    var shop_name = @product.store.shop_name;

    function addCart(){
      console.log(product_name);
           $.ajax({
          type: 'GET',
          url: '/quotes/new',
          dataType: 'json',
          data: { 'name' : product_name, 'id' : product_id, 'price': product_price, 'status': product_status,'short_desc': product_short_desc, 'long_desc': product_long_desc, 'shop_name': shop_name} 
        });

    }

  </script>
    t.string "quantity"
    t.string "min_quantity"
    t.string "min_sale_quantity"
    t.string "max_sale_quantity"
    t.string "is_in_stock"
    t.string "status"