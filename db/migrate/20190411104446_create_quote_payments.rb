class CreateQuotePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :quote_payments do |t|
      t.string :method
      t.references :quote, foreign_key: true

      t.timestamps
    end
  end
end
