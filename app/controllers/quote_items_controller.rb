class QuoteItemsController < ApplicationController
  before_action :set_quote_item, only: [:show, :edit, :update, :destroy]

  # GET /quote_items
  # GET /quote_items.json
  def index
    @quote_items = QuoteItem.where(order_id: current_customer.order_id)
  end

  # GET /quote_items/1
  # GET /quote_items/1.json
  def show
  end

  # GET /quote_items/new
  def new
    @quote_item = QuoteItem.new
  end

  # GET /quote_items/1/edit
  def edit
  end

  # POST /quote_ite
  # POST /quote_items.json
  def create
    respond_to do |format|
    @quote_item = QuoteItem.new(quote_item_params.merge(order_id: current_customer.order_id))
      if @quote_item.save
        format.html { redirect_to @quote_item, notice: 'Quote item was successfully created.' }
        format.json { render :show, status: :created, location: @quote_item }
      else
        format.html { render :new }
        format.json { render json: @quote_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quote_items/1
  # PATCH/PUT /quote_items/1.json
  def update
    respond_to do |format|
      if @quote_item.update(quote_item_params)
        format.html { redirect_to @quote_item, notice: 'Quote item was successfully updated.' }
        format.json { render :show, status: :ok, location: @quote_item }
      else
        format.html { render :edit }
        format.json { render json: @quote_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quote_items/1
  # DELETE /quote_items/1.json
  def destroy
    @quote_item.destroy
    respond_to do |format|
      format.html { redirect_to quote_items_url, notice: 'Quote item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote_item
      @quote_item = QuoteItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quote_item_params
      params.require(:quote_item).permit(:sku, :name, :description, :quantity, :price, :quote_id, :product_id, :store_id)
    end
end
