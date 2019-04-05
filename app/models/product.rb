class Product < ApplicationRecord
    belongs_to :inventory_stock ,required: false
    belongs_to :store ,required: false
end
