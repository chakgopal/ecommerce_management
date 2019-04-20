class QuotePaymentsController < ApplicationController
  before_action :set_quote_payment, only: [:show, :edit, :update, :destroy]

  # GET /quote_payments
  # GET /quote_payments.json
  def index
    @quote_payments = QuotePayment.all
  end

  # GET /quote_payments/1
  # GET /quote_payments/1.json
  def show
  end

  # GET /quote_payments/new
  def new
    @quote_payment = QuotePayment.new
  end

  # GET /quote_payments/1/edit
  def edit
  end

  # POST /quote_payments
  # POST /quote_payments.json
  def create
    @quote_payment = QuotePayment.new(quote_payment_params)

    respond_to do |format|
      if @quote_payment.save
        format.html { redirect_to @quote_payment, notice: 'Quote payment was successfully created.' }
        format.json { render :show, status: :created, location: @quote_payment }
      else
        format.html { render :new }
        format.json { render json: @quote_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quote_payments/1
  # PATCH/PUT /quote_payments/1.json
  def update
    respond_to do |format|
      if @quote_payment.update(quote_payment_params)
        format.html { redirect_to @quote_payment, notice: 'Quote payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @quote_payment }
      else
        format.html { render :edit }
        format.json { render json: @quote_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quote_payments/1
  # DELETE /quote_payments/1.json
  def destroy
    @quote_payment.destroy
    respond_to do |format|
      format.html { redirect_to quote_payments_url, notice: 'Quote payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote_payment
      @quote_payment = QuotePayment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quote_payment_params
      params.require(:quote_payment).permit(:method, :quote_id)
    end
end
