class Order < ApplicationRecord
	has_many :products, dependent: :destroy
	belongs_to :customer, required:false
	belongs_to :quotes, required:false
	has_many :order_items, dependent: :destroy
	belongs_to :customer, required:false
end
