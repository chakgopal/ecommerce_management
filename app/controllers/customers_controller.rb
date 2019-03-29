class CustomersController < ApplicationController
	def root
		if customer_signed_up?
			render "/customer_addresses/new"
		else
			redirect_to new_customer_session_path
		end
	end

end
