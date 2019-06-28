class RemoveQuoteItemIdFromOrder < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :quote_item_id, :bigint
  end
end
