class Categorization < ApplicationRecord
    attr_accessor :product_id, :category_id
    belongs_to :category,class_name: "Product"
end
