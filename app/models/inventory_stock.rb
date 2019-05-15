class InventoryStock < ApplicationRecord

  enum is_in_stock: [:yes, :no]
  after_initialize :set_default_is_in_stock,:if => :new_record?

  def set_default_is_in_stock
     self.is_in_stock ||= :yes
  end  
  belongs_to :product,required:false
  belongs_to :store,required:false
end
