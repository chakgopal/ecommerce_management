class QuotesController < ApplicationController
	def index
		@quotes = Quote.all
	end

	def new
		@quote = Quote.new
	end

	def show
		
	end

	def create
		@quote = Quote.new(qoute_params)
		if(@quote.save)
			redirect_to @quote
		else
			render 'new'
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private def qoute_params
	params.require(:quote).permit(:status,:item_count,:customer_email,:customer_firstname,:customer_lastname,:coupon_code,:subtotal,:subtotal_with_discount,:created_at,:updated_at)

end
