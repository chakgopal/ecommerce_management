class AddSubtotalsToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :grand_total, :integer
    add_column :quotes, :subtotal_with_discount, :integer
  end
end
