class QuoteAddress < ApplicationRecord
  belongs_to :quote
  belongs_to :customer
  belongs_to :customer_address
end
