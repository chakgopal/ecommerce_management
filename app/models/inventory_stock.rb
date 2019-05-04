class InventoryStock < ApplicationRecord

  enum is_in_stock: [:yes, :no]
  after_initialize :set_default_is_in_stock,:if => :new_record?

  def set_default_is_in_stock
     self.status ||= :yes
  end  
  belongs_to :Product,required:false
  def is_in_stock()
    
  end



end
