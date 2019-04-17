class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.decimal :total_paid, precision: 5, scale: 2
      t.string :email_sent
      t.integer :total_invoice
      t.integer :total_cancel
      t.integer :total_refunded
      t.decimal :discount_amount, precision: 5, scale: 2
      t.decimal :discount_cancelled, precision: 5, scale: 2
      t.decimal :discount_invoice, precision: 5, scale: 2
      t.decimal :discount_refunded, precision: 5, scale: 2
      t.decimal :shipping_amount, precision: 5, scale: 2
      t.string :shipping_invoice
      t.decimal :shipping_refunded, precision: 5, scale: 2

      t.timestamps
    end
  end
end
