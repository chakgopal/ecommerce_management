class AddProductToInventoryStock < ActiveRecord::Migration[5.2]
  def change
    add_reference :inventory_stocks, :product, foreign_key: true
  end
end
