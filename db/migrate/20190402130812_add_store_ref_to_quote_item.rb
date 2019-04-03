class AddStoreRefToQuoteItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :quote_items, :store, foreign_key: true
  end
end
