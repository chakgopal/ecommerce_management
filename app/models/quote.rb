class Quote < ApplicationRecord
  belongs_to :store
  belongs_to :customer
  has_many :quote_items
  has_many :orders
end
