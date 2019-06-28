class RemoveSubtotalsFromQuotes < ActiveRecord::Migration[5.2]
  def change
    remove_column :quotes, :grand_total, :decimal
    remove_column :quotes, :subtotal_with_discount, :decimal
  end
end
