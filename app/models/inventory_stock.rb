class InventoryStock < ApplicationRecord
  has_many :products, dependent: :destroy
end
