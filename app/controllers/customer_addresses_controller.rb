class CustomerAddressesController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_customer_address, only: [:show, :edit, :update, :destroy]

  # GET /customer_addresses
  # GET /customer_addresses.json
  def index
    @customer_addresses = CustomerAddress.all
  end

  # GET /customer_addresses/1
  # GET /customer_addresses/1.json
  def show
  end

  # GET /customer_addresses/new
  def new
    @customer_address = CustomerAddress.new
  end

  # GET /customer_addresses/1/edit
  def edit
  end

  # POST /customer_addresses
  # POST /customer_addresses.json
  def create
    @customer_address = CustomerAddress.new(customer_address_params.merge(customer_id: current_customer.id))

    respond_to do |format|
      if @customer_address.save
        format.html { redirect_to "/products"}
        format.json { render :show, status: :created, location: @customer_address }
      else
        format.html { render :new }
        format.json { render json: @customer_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer_addresses/1
  # PATCH/PUT /customer_addresses/1.json
  def update
    respond_to do |format|
      if @customer_address.update(customer_address_params)
        format.html { redirect_to @customer_address, notice: 'Customer address was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer_address }
      else
        format.html { render :edit }
        format.json { render json: @customer_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_addresses/1
  # DELETE /customer_addresses/1.json
  def destroy
    @customer_address.destroy
    respond_to do |format|
      format.html { redirect_to customer_addresses_url, notice: 'Customer address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_address
      @customer_address = CustomerAddress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_address_params
      params.require(:customer_address).permit(:address1, :address2, :city, :state, :postalcode, :country, :phone1, :phone2)
    end
end
