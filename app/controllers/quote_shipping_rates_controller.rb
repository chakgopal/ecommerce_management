class QuoteShippingRatesController < ApplicationController
  before_action :set_quote_shipping_rate, only: [:show, :edit, :update, :destroy]

  # GET /quote_shipping_rates
  # GET /quote_shipping_rates.json
  def index
    @quote_shipping_rates = QuoteShippingRate.all
  end

  # GET /quote_shipping_rates/1
  # GET /quote_shipping_rates/1.json
  def show
  end

  # GET /quote_shipping_rates/new
  def new
    @quote_shipping_rate = QuoteShippingRate.new
  end

  # GET /quote_shipping_rates/1/edit
  def edit
  end

  # POST /quote_shipping_rates
  # POST /quote_shipping_rates.json
  def create
    @quote_shipping_rate = QuoteShippingRate.new(quote_shipping_rate_params)

    respond_to do |format|
      if @quote_shipping_rate.save
        format.html { redirect_to @quote_shipping_rate, notice: 'Quote shipping rate was successfully created.' }
        format.json { render :show, status: :created, location: @quote_shipping_rate }
      else
        format.html { render :new }
        format.json { render json: @quote_shipping_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quote_shipping_rates/1
  # PATCH/PUT /quote_shipping_rates/1.json
  def update
    respond_to do |format|
      if @quote_shipping_rate.update(quote_shipping_rate_params)
        format.html { redirect_to @quote_shipping_rate, notice: 'Quote shipping rate was successfully updated.' }
        format.json { render :show, status: :ok, location: @quote_shipping_rate }
      else
        format.html { render :edit }
        format.json { render json: @quote_shipping_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quote_shipping_rates/1
  # DELETE /quote_shipping_rates/1.json
  def destroy
    @quote_shipping_rate.destroy
    respond_to do |format|
      format.html { redirect_to quote_shipping_rates_url, notice: 'Quote shipping rate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote_shipping_rate
      @quote_shipping_rate = QuoteShippingRate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quote_shipping_rate_params
      params.require(:quote_shipping_rate).permit(:method_description, :price, :quote_payment_id, :quote_address_id)
    end
end
