
class OrdersController < ApplicationController
  #before_action :set_order
  

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def checkout
    product_id = params[:id]
    product_details = Product.where(id: product_id)
    @product_price = product_details[0].price
    if customer_signed_in?
      customer_id = current_customer.id  
      if customer_id.present?
        customer_details = Customer.find(customer_id)
        @customer_login_details = customer_details.email 
     else
       flash[:notice] = "please sign in before placing your order"
       redirect_to  new_customer_session_path
     end
   end      
    @customer_address_details = CustomerAddress.find(customer_id) rescue ActiveRecord::RecordNotFound    
  end  
  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    if customer_signed_in?
      respond_to do |format|
        @order = Order.new(order_params.merge(customer_id: current_customer.id))
        if @order.save

          format.html { redirect_to @order, notice: 'Order was successfully created.' }
          format.json { render :show, status: :created, location: @order }
        else

          format.html { render :new }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
   else
       flash[:notice] = "please sign in before placing your order"
    end
 end
    
  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:total_paid, :email_sent, :total_invoice, :total_cancel, :total_refunded, :discount_amount, :discount_cancelled, :discount_invoice, :discount_refunded, :shipping_amount, :shipping_invoice, :shipping_refunded)
    end
end
