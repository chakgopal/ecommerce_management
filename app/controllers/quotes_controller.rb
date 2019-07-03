class QuotesController < ApplicationController
  before_action :authenticate_customer!, only: [:new_quote, :show_cart, :remove_item,:place_order_for_cart_items]

def new_quote
  if customer_signed_in?
    id = params[:id] if params[:id].present?
    
    @product_details = Product.find(id)
    
    
    if customer_signed_in? 
     quote_count = Quote.where(customer_id: current_customer.id).count
     if quote_count == 0
       quotes = Quote.new
       if quotes.status == "active"
          quotes.customer_id = current_customer.id
          quotes.save
          quote_item = QuoteItem.new
          quote_item.sku = @product_details.sku
          quote_item.name = @product_details.name 
          quote_item.description = @product_details.long_desc
          quote_item.price = @product_details.price
          quote_item.quote_id = quotes.id
          quote_item.product_id = @product_details.id
          quote_item.store_id = @product_details.store_id
          quote_item.quantity = 1
          quote_item.save
       end  
      else 
          quote_item = QuoteItem.new
          quote_details = Quote.where(customer_id: current_customer.id)
          quote_item.sku = @product_details.sku
          quote_item.name = @product_details.name 
          quote_item.description = @product_details.long_desc
          quote_item.price = @product_details.price
          quote_item.quote_id = quote_details[0]["id"]
          quote_item.product_id = @product_details.id
          quote_item.store_id = @product_details.store_id
          quote_item.quantity = 1
          quote_item.save
      end
   end
   redirect_to show_cart_quotes_url
 else
  redirect_to new_customer_session_path
 end
end

def show_cart
  
     session[:customer_id] = current_customer.id
     subtotal = 0
     product_price = 0
     id = params[:id] if params[:id].present?
     quant = params[:qty] if params[:qty].present?
     quotes = Quote.where(customer_id:current_customer.id).first
     QuoteItem.where(product_id:id ).where(quote_id:quotes.id).update(quantity:quant)
     quote_item = QuoteItem.where(quote_id:quotes.id)
     
    
     
     quote_item.each do|q|
         if q.quantity.to_i > 1
           product_price = q.price.to_f * q.quantity.to_i
         else 
           product_price = q.price.to_f * 1
         end  
         
         subtotal+=  product_price 
         
     end
     
     Quote.where(customer_id:current_customer.id).update(subtotal:subtotal)
         
      quotes = Quote.where(customer_id:current_customer.id).first
      quote_item = QuoteItem.where(quote_id:quotes.id).where(product_id: id)
      if quote_item.blank?
        @quantity = 1
      else
        @quantity = quote_item[0].quantity
        
      end

      quote_id = quotes.id if quotes.present?
      @cart_items = []
      product_ids = []
      quote_items = QuoteItem.where(quote_id:quote_id)
      @quote_items_count = QuoteItem.where(quote_id:quote_id).count
      if @quote_items_count > 0
         quote_items.each do|q|
            product_id = q.product_id
            product_ids << product_id
            product_details = Product.where(id:product_id)
            cart_items_hash ={}
            cart_items_hash["name"] = product_details[0]["name"]
            cart_items_hash["price"] = product_details[0]["price"]
            cart_items_hash["shop_name"] = product_details[0].store.shop_name
            cart_items_hash["count"] = @quote_items_count
            cart_items_hash["desc"] = product_details[0]["short_desc"]
            @cart_items << cart_items_hash
          end
          @product_details = Product.where('id IN (?)', product_ids)
          @subtotal = quotes.subtotal
      end 
end

def remove_item_from_cart
  
  product_id = params[:id]
  customer_id = current_customer.id
  quote_details = Quote.where(customer_id:customer_id)
  quote_id = quote_details[0]["id"]
  QuoteItem.where(quote_id:quote_id).where(product_id:product_id).delete_all
  quote_item_details = QuoteItem.where(quote_id:quote_id).where(product_id:product_id)
  
  redirect_to show_cart_quotes_url
end

def quantity_of_cart_items
  id = params[:id] if params[:id].present?
  quotes = Quote.where(customer_id:current_customer.id).first
  quote_items = QuoteItem.where(product_id:id ).where(quote_id:quotes.id)
  quote_items_quantity = quote_items[0].quantity
  
  render :json=>quote_items_quantity
end

def items_in_cart_with_quantity
  quote_item_id_with_quantity = []
  quote_details = Quote.where(customer_id:current_customer.id)
  quote_id = quote_details[0].id
  quote_item_details = QuoteItem.where(quote_id:quote_id)
  quote_item_details.each do|qi|
    data_hash = {}
    data_hash["quote_item_product_id"] = qi.product_id
    data_hash["quantity"] = qi.quantity
    quote_item_id_with_quantity << data_hash
  end
  
  render :json=>quote_item_id_with_quantity.to_json
end



def place_order_for_cart_items
  current_customer_cart = Quote.where(customer_id: current_customer.id)
  current_customer_cart_id = current_customer_cart[0].id
  @current_customer_items_in_cart = QuoteItem.where(quote_id:current_customer_cart_id)
  customer_id = current_customer.id  
      if customer_id.present?
        customer_details = Customer.find(customer_id)
        @customer_login_details = customer_details.email 
      end
  @subtotal = current_customer_cart[0].subtotal  
end

def checkout_for_cart_item
  cart_items_details = ActiveSupport::JSON.decode( params[:data] )
  puts ">>>>"+cart_items_details.to_json
  loged_in_customer_id = current_customer.id
  order_obj = Order.new
  order_obj.customer_id = loged_in_customer_id
  order_obj.save
  cart_items_details.each do|ci|
    order_obj = Order.where(customer_id: loged_in_customer_id)
    order_item_obj = OrderItem.new
    order_item_obj.name = ci["name"]
    order_item_obj.sku = ci["sku"]
    order_item_obj.description = ci["description"]
    order_item_obj.store_id = ci["store_id"]
    order_item_obj.quantity = ci["quantity"]
    order_item_obj.price = ci["total_price"]
    order_item_obj.product_id =ci["product_id"]
    order_item_obj.order_id = order_obj[0].id
    order_item_obj.save
    QuoteItem.where(product_id:ci["product_id"]).delete_all
  end
  
end

end
