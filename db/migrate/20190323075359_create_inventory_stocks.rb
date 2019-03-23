class CreateInventoryStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :inventory_stocks do |t|
      t.string :product_id
      t.string :quantity
      t.string :min_quantity
      t.string :min_sale_quantity
      t.string :max_sale_quantity
      t.string :is_in_stock
      t.string :status

      t.timestamps
    end
  end
end
