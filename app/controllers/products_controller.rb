class ProductsController < ApplicationController
  before_action :authenticate_seller!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  #before_action :set_store, only: [:create, :edit, :update, :destroy]
  # GET /products
  # GET /products.json
  def index
    if seller_signed_in?
      @products = current_seller.products.order(:name).page params[:page]
      @inventory_stock_count = InventoryStock.where(product_id:@products[0].id).count if @products.present?
      @inventory_stock = InventoryStock.where(product_id:@products[0].id).first if @products.present?
      puts @inventory_stock_count.to_s
     
      #@products = current_seller.products.where(status:'active')
       #puts @products.to_json
      
      @inventory_stock_count = []
      @inventory_stock = []
      @products.each do|p|
         data_hash = {}
         inventory_stock_result_count = InventoryStock.where(product_id:p.id).count
         inventory_stock = InventoryStock.where(product_id:p.id)
         inventory_stock.each do|i|
           inventory_data_hash = {}
           inventory_data_hash["id"] = i.id
           inventory_data_hash["product_id"] = i.product_id
           @inventory_stock << inventory_data_hash
         end  
          data_hash["pid"] = p.id
          data_hash["count"] = inventory_stock_result_count
         @inventory_stock_count << data_hash
      end
    else
      @products = Product.with_attached_images.order(:name).page params[:page]
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    if customer_signed_in?
      item_in_cart = Quote.where(customer_id:current_customer.id).first
      quote_id = item_in_cart.id if item_in_cart.present?
      @in_cart = QuoteItem.where(quote_id:quote_id).where(product_id:params[:id])
      #@product_id_in_cart = in_cart[0]["product_id"] if in_cart.present?
      #puts @product_id_in_cart.to_s
    end  
  end
  # GET /products/new
  def new
    @seller_id = current_seller.id
    @product = Product.new
    #@store_name = Store.where(seller_id:seller_id)
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params.merge(seller_id: current_seller.id))

    respond_to do |format|
     if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    
    @product.update(status:'inactive')
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def send_email
    if customer_signed_in?
    @customer = current_customer.email
    @product = Product.find(params[:id])
    puts @product.name
    #puts @product.price
    OrderNotifierMailer.order_create_email(@customer,@product).deliver_now
    end
    render :plain => 'message sent'
   

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product

      @product = Product.find(params[:id])
    end

    #def set_store
       #redirect_to new_store_url
    #end



    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :sku, :status, :short_desc, :long_desc, :price, :color, :store_id, images: [])
    end
end
