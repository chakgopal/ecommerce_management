class ProductsController < ApplicationController
  
  before_action :authenticate_seller!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  #before_action :set_store, only: [:create, :edit, :update, :destroy]
  # GET /products
  # GET /products.json
  def index
    if seller_signed_in?
      @products = current_seller.products.where(status:'active')
       #puts @products.to_json
    else
      @products = Product.with_attached_images.where(status:'active')
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    
    @product = Product.find(params[:id])
  end
  # GET /products/new
  def new
    @product = Product.new
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
