class AddQuoteItemsToStore < ActiveRecord::Migration[5.2]
  def change
    add_reference :stores, :quote_item, foreign_key: true
  end
end
