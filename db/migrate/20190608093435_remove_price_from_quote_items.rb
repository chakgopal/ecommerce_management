class RemovePriceFromQuoteItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :quote_items, :price, :decimal
  end
end
