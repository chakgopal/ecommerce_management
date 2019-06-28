class RemoveQuoteItemIdFromQuote < ActiveRecord::Migration[5.2]
  def change
    remove_column :quotes, :quote_item_id, :bigint
  end
end
