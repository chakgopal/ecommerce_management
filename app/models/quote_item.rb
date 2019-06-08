class QuoteItem < ApplicationRecord
  belongs_to :quote,required: false
  belongs_to :product,required: false
  belongs_to :store,required: false
  belongs_to :order,required: false
end
