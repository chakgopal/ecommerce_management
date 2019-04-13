class QuotesController < ApplicationController
 
 def new

  end 

  def create
   
    logger.info current_customer.inspect
    @order= Order.new(order_params.merge(customer_id: current_customer.id))
    if @quote.save
      render :plain => "Order generate successfully"
      #redirect_to store_path
    else
      redirect_to 'new'
    end
   end
  
  def index
     @orders = Order.where(customer_id: current_customer.id)
  end


  private
 def order_params
    params.require(:order).permit(:)
 end
end



end
