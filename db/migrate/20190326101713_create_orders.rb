class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :total_paid
      t.string :email_sent
      t.string :total_invoice
      t.string :total_cancel
      t.string :total_refunded
      t.string :discount_amount
      t.string :discount_canceled
      t.string :discount_invoice
      t.string :discount_refunded
      t.string :shipping_amount
      t.string :shipping_canceled
      t.string :shipping_invoice
      t.string :shipping_refunded

      t.timestamps
    end
  end
end
