class Quote < ApplicationRecord
  enum status: [:active, :inactive]
  #after_initialize :set_default_status
  #before_create {self.status = 'active'}

  belongs_to :store,required: false
  belongs_to :customer,required: false
  has_many :quote_items,dependent: :destroy
  has_many :orders,dependent: :destroy
  
end
