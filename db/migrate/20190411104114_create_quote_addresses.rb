class CreateQuoteAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :quote_addresses do |t|
      t.string :customer_address_type
      t.string :same_as_billing
      t.string :free_shipping
      t.string :shipping_method
      t.references :quote, foreign_key: true
      t.references :customer, foreign_key: true
      t.references :customer_address, foreign_key: true

      t.timestamps
    end
  end
end
