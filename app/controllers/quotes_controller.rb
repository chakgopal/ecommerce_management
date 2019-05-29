class QuotesController < ApplicationController

def new_quote
 id = params[:id] if params[:id].present?
 @product_details = Product.find(id)
 inventory_details = InventoryStock.where(product_id: @product_details.id)
 @quant = inventory_details[0].quantity if inventory_details.present?
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
          item_count = QuoteItem.where(quote_id:quote_details[0]["id"]).count
          puts item_count.to_s
          #quote_items = QuoteItem.where(quote_id:1)
      end
  end
  render :plain =>""
end

# def show_cart
#   if customer_signed_in?

#   end  
# end   
end
