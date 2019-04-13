class CreateQuoteItems < ActiveRecord::Migration[5.2]
  def change
    create_table :quote_items do |t|
      t.string :sku
      t.string :name
      t.string :description
      t.integer :quantity
      t.decimal :price, precision: 5, scale: 2
      t.references :quote, foreign_key: true
      t.references :product, foreign_key: true
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
