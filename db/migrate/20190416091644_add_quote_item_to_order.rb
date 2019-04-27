class AddQuoteItemToOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :quote_item, foreign_key: true
  end
end
