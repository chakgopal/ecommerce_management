class AddPriceToQuoteItems < ActiveRecord::Migration[5.2]
  def change
    add_column :quote_items, :price, :integer
  end
end
