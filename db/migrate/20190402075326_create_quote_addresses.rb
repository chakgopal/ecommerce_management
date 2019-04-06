class CreateQuoteAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :quote_addresses do |t|
      t.references :quote, foreign_key: true
      t.references :customer, foreign_key: true
      t.string :customer_address_type
      t.string :email
      t.string :first_name
      t.string :post_code
      t.boolean :same_as_billing
      t.boolean :free_shipping
      t.string :shipping_method

      t.timestamps
    end
  end
end
