class OrderItem < ApplicationRecord
  belongs_to :order, required:false
  belongs_to :store, required:false
  belongs_to :product, required: false
end
