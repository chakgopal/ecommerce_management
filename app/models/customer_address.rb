class CustomerAddress < ApplicationRecord
	belongs_to :customer, required:false
	validates :address1, :address2, :city, :state, :postalcode, :country, presence:true
	validates :phone1,:phone2,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 10, :maximum => 15 } 
end
