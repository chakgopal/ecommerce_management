class QuotesController < ApplicationController
  before_action :authenticate_customer!, only: [:new, :create,:destroy]
    def new
      id = params[:id] if params[:id].present?
      product_details = Product.find(id)
      images = product_details.images if product_details.images.attached?
      status = product_details.status
      sku = params[:sku]
      price = params[:price]
      short_desc = params[:short_desc]
      shop_name = params[:store_name]
      if customer_signed_in?
         quotes_count = Quote.where(customer_id: current_customer.id).count
         if quotes_count == 0
           @quote = Quote.new  
         end
      end
      @data_hash ={}
      @data_hash["id"] = id
      @data_hash["customer_id"] = current_customer.id
      @data_hash["short_desc"] = short_desc
      @data_hash["price"] = price
      @data_hash["sku"] = sku
      @data_hash["shop_name"] = shop_name
      @data_hash["images"] = images
      @data_hash["status"] = status
   end
end
