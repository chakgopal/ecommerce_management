class OrdersController < ApplicationController
 def create
    @order = current_order
    @order_item = @order.order_items.new(order_params)
    @order.save
    session[:order_id] = @order.id
 end


 def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
 end

  private
  def order_params
    params.require(:order).permit(:total_paid, :email_sent, :total_invoice, :total_cancel,:total_refunded,:discount_amount,:discount_canceled,:discount_invoice,:discount_refunded,:shipping_amount,:shipping_canceled,:shipping_invoice,:shipping_refunded,:created_at,:updated_at)
  end
end
