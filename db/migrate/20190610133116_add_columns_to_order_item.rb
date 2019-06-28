class AddColumnsToOrderItem < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :sku, :string
    add_column :order_items, :name, :string
    add_column :order_items, :description, :string
    add_column :order_items, :quantity, :integer
    add_column :order_items, :price, :integer
  end
end
