class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string :status
      t.string :item_count
      t.string :customer_email
      t.string :customer_firstname
      t.string :customer_lastname
      t.string :coupon_code
      t.string :subtotal
      t.string :subtotal
      t.string :subtotal_with_discount

      t.timestamps
    end
  end
end
