class OrderAddress < ApplicationRecord
  belongs_to :order
  belongs_to :customer_address
end
