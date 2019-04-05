class RemoveProductIdFromInventoryStocks < ActiveRecord::Migration[5.2]
  def change
    remove_column :inventory_stocks, :product_id, :string
  end
end
