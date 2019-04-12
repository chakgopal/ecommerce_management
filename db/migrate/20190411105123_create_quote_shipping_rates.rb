class CreateQuoteShippingRates < ActiveRecord::Migration[5.2]
  def change
    create_table :quote_shipping_rates do |t|
      t.string :method_description
      t.decimal :price, precision: 5, scale: 2
      t.references :quote_payment, foreign_key: true
      t.references :quote_address, foreign_key: true

      t.timestamps
    end
  end
end
