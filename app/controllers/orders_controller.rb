
class OrdersController < ApplicationController
  
  

  def checkout
    if customer_signed_in?
      
       
      @product_detail = Product.find_by_id(params[:id])
      @product_price = @product_detail.price
     
      loged_in_customer_cart = Quote.where(customer_id: current_customer.id )
      loged_in_customer_cart_id = loged_in_customer_cart[0].id
      quote_item = QuoteItem.new
      quote_item.sku = @product_detail.sku
      quote_item.name = @product_detail.name 
      quote_item.description = @product_detail.long_desc
      quote_item.price = @product_detail.price
      quote_item.quote_id = loged_in_customer_cart_id
      quote_item.product_id = @product_detail.id
      quote_item.store_id = @product_detail.store_id
      quote_item.save

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
  ordered_product_ids = []
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
  order_item_obj.save
  ordered_product = OrderItem.all 
  ordered_product.each do|op|
    ordered_product_ids << op.product_id
  end
  QuoteItem.where('product_id IN (?)', ordered_product_ids).delete_all
  if order_item_obj.save
    @customer = current_customer.email
    @product = Product.find(params[:id])
    OrderNotifierMailer.order_create_email(@customer,@product).deliver_now
    redirect_to root_path
  else
    render :plain => 'message not sent'
  end
end

def order_history
  if customer_signed_in?
    order_details = Order.where(customer_id: current_customer.id)
    order_ids = []
    order_details.each do|od|
      order_ids << od.id
    end
    @order_items = OrderItem.where('order_id IN (?)', order_ids)
  else
    flash[:notice] = "please sign in before checking order history"
    redirect_to  new_customer_session_path 
  end
end

end
