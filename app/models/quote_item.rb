class QuoteItem < ApplicationRecord
  belongs_to :quote
  belongs_to :product
  belongs_to :store
  belongs_to :order
end
