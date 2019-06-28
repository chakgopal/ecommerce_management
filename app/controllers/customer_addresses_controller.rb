class CustomerAddressesController < ApplicationController

  include Veriffyy

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

     
      if valid_phone_number?(customer_address_params['country_code'], customer_address_params['phone1'])
        @customer_address.save
        redirect_to @customer_address , notice: 'You have a valid phone number!'
      else
        flash.alert = 'Please enter a valid phone number'
        render :new
      end
  end

  # PATCH/PUT /customer_addresses/1
  # PATCH/PUT /customer_addresses/1.json
  def update
    
    
    @customer = Customer.find(params[:id])
    @customer_address = CustomerAddress.find(params[:id])
    if  valid_confirmation_code?(params['code'], @customer_address.country_code, @customer_address.phone1)
      @customer_address.update(verified: true)
     OrderNotifierMailer.phone_no_email(@customer,@customer_address).deliver_now
     redirect_to products_path, notice: "#{@customer_address.phone1} has been verified!"
    else
      redirect_to @customer_address, alert: 'invalid or expired token'
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
      params.require(:customer_address).permit(:address1, :address2, :city, :state, :postalcode, :country, :phone1, :phone2, :country_code)
    end
end


