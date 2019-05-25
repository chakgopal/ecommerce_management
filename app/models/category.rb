class Category < ApplicationRecord
  has_many :children, :classname => "Category", :foreign_key => "category_id" :dependent => :destroy
  belongs_to :parent, :classname => "Category"
  belongs_to :product
end
