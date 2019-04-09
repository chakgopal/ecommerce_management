class CreateQuoteShippingRates < ActiveRecord::Migration[5.2]
  def change
    create_table :quote_shipping_rates do |t|
      t.references :quote_address, foreign_key: true
      t.string :method
      t.string :method_description
      t.string :price

      t.timestamps
    end
  end
end
