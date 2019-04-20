class OrderAddressesController < ApplicationController
  before_action :set_order_address, only: [:show, :edit, :update, :destroy]

  # GET /order_addresses
  # GET /order_addresses.json
  def index
    @order_addresses = OrderAddress.all
  end

  # GET /order_addresses/1
  # GET /order_addresses/1.json
  def show
  end

  # GET /order_addresses/new
  def new
    @order_address = OrderAddress.new
  end

  # GET /order_addresses/1/edit
  def edit
  end

  # POST /order_addresses
  # POST /order_addresses.json
  def create
    @order_address = OrderAddress.new(order_address_params)

    respond_to do |format|
      if @order_address.save
        format.html { redirect_to @order_address, notice: 'Order address was successfully created.' }
        format.json { render :show, status: :created, location: @order_address }
      else
        format.html { render :new }
        format.json { render json: @order_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_addresses/1
  # PATCH/PUT /order_addresses/1.json
  def update
    respond_to do |format|
      if @order_address.update(order_address_params)
        format.html { redirect_to @order_address, notice: 'Order address was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_address }
      else
        format.html { render :edit }
        format.json { render json: @order_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_addresses/1
  # DELETE /order_addresses/1.json
  def destroy
    @order_address.destroy
    respond_to do |format|
      format.html { redirect_to order_addresses_url, notice: 'Order address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_address
      @order_address = OrderAddress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_address_params
      params.require(:order_address).permit(:order_id, :customer_address_id)
    end
end
