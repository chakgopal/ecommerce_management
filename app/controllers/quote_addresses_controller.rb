class QuoteAddressesController < ApplicationController
  before_action :set_quote_address, only: [:show, :edit, :update, :destroy]

  # GET /quote_addresses
  # GET /quote_addresses.json
  def index
    @quote_addresses = QuoteAddress.all
  end

  # GET /quote_addresses/1
  # GET /quote_addresses/1.json
  def show
  end

  # GET /quote_addresses/new
  def new
    @quote_address = QuoteAddress.new
  end

  # GET /quote_addresses/1/edit
  def edit
  end

  # POST /quote_addresses
  # POST /quote_addresses.json
  def create
    @quote_address = QuoteAddress.new(quote_address_params)

    respond_to do |format|
      if @quote_address.save
        format.html { redirect_to @quote_address, notice: 'Quote address was successfully created.' }
        format.json { render :show, status: :created, location: @quote_address }
      else
        format.html { render :new }
        format.json { render json: @quote_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quote_addresses/1
  # PATCH/PUT /quote_addresses/1.json
  def update
    respond_to do |format|
      if @quote_address.update(quote_address_params)
        format.html { redirect_to @quote_address, notice: 'Quote address was successfully updated.' }
        format.json { render :show, status: :ok, location: @quote_address }
      else
        format.html { render :edit }
        format.json { render json: @quote_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quote_addresses/1
  # DELETE /quote_addresses/1.json
  def destroy
    @quote_address.destroy
    respond_to do |format|
      format.html { redirect_to quote_addresses_url, notice: 'Quote address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote_address
      @quote_address = QuoteAddress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quote_address_params
      params.require(:quote_address).permit(:customer_address_type, :same_as_billing, :free_shipping, :shipping_method, :quote_id, :customer_id, :customer_address_id)
    end
end
