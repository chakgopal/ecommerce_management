class QuoteShippingRate < ApplicationRecord
  belongs_to :quote_payment
  belongs_to :quote_address
end
