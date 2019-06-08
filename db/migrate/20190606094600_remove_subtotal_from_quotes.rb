class RemoveSubtotalFromQuotes < ActiveRecord::Migration[5.2]
  def change
    remove_column :quotes, :subtotal, :decimal
  end
end
