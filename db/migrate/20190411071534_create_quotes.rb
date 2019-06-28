class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string :status
      t.integer :item_count
      t.integer :item_quantity
      t.decimal :grand_total, precision: 7, scale: 2
      t.string :coupon_code
      t.decimal :subtotal, precision: 7, scale: 2
      t.decimal :subtotal_with_discount, precision: 7, scale: 2
      t.references :store, foreign_key: true
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
