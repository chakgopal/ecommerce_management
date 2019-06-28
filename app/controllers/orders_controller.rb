
class OrdersController < ApplicationController
  #before_action :set_order
  

  def checkout
    if customer_signed_in?
      
       
      @product_detail = Product.find_by_id(params[:id])
      @product_price = @product_detail.price
      
      customer_id = current_customer.id  
      if customer_id.present?
        customer_details = Customer.find(customer_id)
        @customer_login_details = customer_details.email 
      end      
    @customer_address_details = CustomerAddress.find(customer_id) rescue ActiveRecord::RecordNotFound
    else
      flash[:notice] = "please sign in before placing your order"
      redirect_to  new_customer_session_path 
    end
     if @customer_address_details.nil?
     end    
  end  


def order_price
  quantity = params[:qty].present? ? params[:qty] : "1"
  @product_detail = Product.find_by_id(params[:id])
  product_price = @product_detail.price
  @product_price_with_quant = product_price.to_f * quantity.to_i 
  render :json=>@product_price_with_quant
end
def place_order
  order_price = params[:price]
  order_quantity = params[:qty]
  order_product_id = params[:id]
  loged_in_customer_id = current_customer.id
  order_obj = Order.new
  order_obj.customer_id = loged_in_customer_id
  order_obj.save
  product = Product.find(order_product_id)
  order_obj = Order.where(customer_id: loged_in_customer_id)
  order_item_obj = OrderItem.new
  order_item_obj.name = product.name
  order_item_obj.sku = product.sku
  order_item_obj.description = product.short_desc
  order_item_obj.store_id = product.store_id
  order_item_obj.quantity = order_quantity
  order_item_obj.price = order_price
  order_item_obj.product_id =order_product_id
  order_item_obj.order_id = order_obj[0].id
  if order_item_obj.save
    if customer_signed_in?
      @customer = current_customer.email
      @product = Product.find(params[:id])
      #@seller = Seller.find(params[:id])
      #@store = Store.find(params[:id])
     
      #puts @product.price
      OrderNotifierMailer.order_create_email(@customer,@product).deliver_now
      end
      redirect_to root_path
  else
    render :plain => 'message not sent'

  
end
end

def check_orders
  if customer_signed_in?
    
   
    #@product_price = @product_detail.price
    
    customer_id = current_customer.id  
    if customer_id.present?
    customer_details = Customer.find(customer_id)
        
    #@product_details = Product.find(params[:id])
    orders = Order.where(customer_id:current_customer.id)
    #order_items = OrderItem.where(order_id:orders.id)
    order_ids = []
    orders.each do|q|
      #order_id = q.order_id
      order_ids << q.id
      #order_details = OrderItem.where(id:order_id)
    end
    @order_details = OrderItem.where('id IN (?)',order_ids)

    
       
    end 
  else
    redirect_to new_customer_session_path
  end
  
end

end
