class RemoveItemQuantityFromQuotes < ActiveRecord::Migration[5.2]
  def change
    remove_column :quotes, :item_quantity, :integer
  end
end
