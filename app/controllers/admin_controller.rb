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
end