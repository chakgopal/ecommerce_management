class RemoveIsInStockFromInventoryStocks < ActiveRecord::Migration[5.2]
  def change
    remove_column :inventory_stocks, :is_in_stock, :string
  end
end
