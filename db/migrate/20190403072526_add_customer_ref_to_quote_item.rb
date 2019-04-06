class AddCustomerRefToQuoteItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :quote_items, :customer, foreign_key: true
  end
end
