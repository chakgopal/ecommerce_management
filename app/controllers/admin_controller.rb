class AdminController < ApplicationController
 
def index
	render layout: false
end
   
 def seller_index
 	
   @seller = Seller.all
   puts @seller.to_json
 end 
 def customer_index
   @customer = Customer.all
   puts @customer.to_json
 end
 def order  
  @order = Order.all
  puts @order.to_json
 end 
  
 def quote
  @quote = Quote.all
  puts @quote.to_json
  end	

 def quote_item
  @quote_item = QuoteItem.all
  puts @quote_item.to_json
 end

  def store_info
  	@store = Store.all
  	count = Store.count
  	for i in 0..count-1
  	seller_id = @store[i]["seller_id"]
  	@seller_information = Seller.find(seller_id)
  	end
  end

  end
 
  


