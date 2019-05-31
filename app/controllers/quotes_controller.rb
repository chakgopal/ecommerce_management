class QuotesController < ApplicationController
 before_action :set_quote, only: [:show, :edit, :update, :destroy]
 before_action :authenticate_customer!, only: [:new, :create, :destroy]
  # GET /quotes
  # GET /quotes.json
  def index
    if customer_signed_in?
      @quotes = Quote.where(customer_id:current_customer.id).all
   end 
  end

  # GET /quotes/1
  # GET /quotes/1.json
  def show
    @quote = Quote.find(params[:id])
  end

  # GET /quotes/new
  def new
    id = params[:id] if params[:id].present?
    @product_details = Product.find(id)
    status = @product_details.status
    inventory_details = InventoryStock.where(product_id: @product_details.id)
    @quant = inventory_details[0].quantity if inventory_details.present?
    if customer_signed_in? 
      quote_count = Quote.where(customer_id: current_customer.id).count
      if quote_count == 0
        @quote = Quote.new
      end
    end
  end  
# GET /quotes/1/edit
  def edit
  end

  # POST /quotes
  # POST /quotes.json
  def create
    @quote = Quote.new(quote_params)

    respond_to do |format|
      if @quote.save
         # Deliver the signup email
     
      
     
        format.html { redirect_to @quote, notice: 'Quote was successfully created.' }
        format.json { render :show, status: :created, location: @quote }
      else
        format.html { render :new }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotes/1
  # PATCH/PUT /quotes/1.json
  def update
    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to @quote, notice: 'Quote was successfully updated.' }
        format.json { render :show, status: :ok, location: @quote }
      else
        format.html { render :edit }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.json
  def destroy
    @quote.destroy if @quote.id == session[:id]
    session[:id] = nil
    respond_to do |format|
      format.html { redirect_to quotes_url, notice: 'Quote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      
      @quote = Quote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quote_params
      params.fetch(:quote, {})
    end


  
end
