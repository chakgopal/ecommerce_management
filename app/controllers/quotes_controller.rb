class QuotesController < ApplicationController
  before_action :authenticate_customer!, only: [:new_quote, :show_cart, :remove_item]

def new_quote
  if customer_signed_in?
    id = params[:id] if params[:id].present?
    
    @product_details = Product.find(id)
<<<<<<< HEAD
    inventory_details = InventoryStock.where(product_id: @product_details.id)
    @quant = inventory_details[0].quantity if inventory_details.present?
=======
    
    
>>>>>>> fd74ded663917e2068024f3adc91e22a5a0d436f
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
          quote_item.save
      end
   end
   redirect_to show_cart_quotes_url
 else
  redirect_to new_customer_session_path
 end
end

def show_cart
   if customer_signed_in?
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
            #cart_items_hash["shop_name"] = product_details[0].store.shop_name
            cart_items_hash["count"] = @quote_items_count
            cart_items_hash["desc"] = product_details[0]["short_desc"]
            @cart_items << cart_items_hash
          end
          @product_details = Product.where('id IN (?)', product_ids)
          @subtotal = quotes.subtotal
      end 
    else
      redirect_to new_customer_session_path
    end
    puts 
end

def remove_item_from_cart
  customer_id = session[:customer_id]
  product_id = params[:id]
  customer_id = current_customer.id
  quote_details = Quote.where(customer_id:customer_id)
  quote_id = quote_details[0]["id"]
  QuoteItem.where(quote_id:quote_id).where(product_id:product_id).delete_all
  quote_item_details = QuoteItem.where(quote_id:quote_id).where(product_id:product_id)
  
  redirect_to show_cart_quotes_url
end

<<<<<<< HEAD
def quote_item_checkout
end

def show_order
=======
def place_order_for_cart_items
  current_customer_cart = Quote.where(customer_id: current_customer.id)
  current_customer_cart_id = current_customer_cart[0].id
  current_customer_items_in_cart = QuoteItem.where(quote_id:current_customer_cart_id)
  current_customer_order_obj = Order.new
  order_obj.customer_id = current_customer.id
  order_obj.save
  current_customer_order = Order.where(customer_id: current_customer.id)
  current_customer_order_id = current_customer_order[0].id
  
>>>>>>> fd74ded663917e2068024f3adc91e22a5a0d436f
end

end
