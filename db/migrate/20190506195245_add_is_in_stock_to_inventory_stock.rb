class AddIsInStockToInventoryStock < ActiveRecord::Migration[5.2]
  def change
    add_column :inventory_stocks, :is_in_stock, :integer
  end
end
