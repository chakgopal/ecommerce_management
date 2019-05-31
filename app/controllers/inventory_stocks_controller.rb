class InventoryStocksController < ApplicationController
    before_action :authenticate_seller!, only: [:new, :create, :edit, :update, :destroy]
    before_action :set_inventory_stock, only: [:show, :edit, :update, :destroy]
    
    def new
     @product_id = params[:id]
     @inventory_stock = InventoryStock.new
     session[:id] = @product_id
     product_id = @product_id
     @product = Product.find(product_id)
     puts @product.to_json
     @stat = @product.status
    end
    
    def create
       @product_id = session[:id]
        @inventory_stock = InventoryStock.new(inventory_stock_params.merge(product_id: @product_id))
        respond_to do |format|
            if  @inventory_stock.save
                #inventory_stock = InventoryStock.where(product_id: @product_id)
                #quantity = inventory_stock.quantity
               format.html { redirect_to  @inventory_stock, notice: 'Inventory Stock was successfully created.' }
               format.json { render :show, status: :created, location:  @inventory_stock }
             else
               format.html { render :new }
               format.json { render json:  @inventory_stock.errors, status: :unprocessable_entity }
             end
        end
    end    

    def show
      @inventory_stock = InventoryStock.find(params[:id])
      render :plain=>"Added in Inventory Stock"
    end

    def edit
    end
    
    def update
      respond_to do |format|
        if @inventory_stock.update(inventory_stock_params)
          format.html { redirect_to @inventory_stock, notice: 'Product was successfully updated.' }
          format.json { render :show, status: :ok, location: @inventory_stock }
        else
          format.html { render :edit }
          format.json { render json: @inventory_stock.errors, status: :unprocessable_entity }
        end
      end
    end  


private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory_stock
        @inventory_stock = InventoryStock.find_by(id: params[:id])
    end



    # Never trust parameters from the scary internet, only allow the white list through.
    def inventory_stock_params
      params.require(:inventory_stock).permit(:quantity,:min_quantity,:max_quantity,:min_sale_quantity,:max_sale_quantity,:is_in_stock,:status)
    end
   
end 