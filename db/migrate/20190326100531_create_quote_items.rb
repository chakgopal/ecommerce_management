class CreateQuoteItems < ActiveRecord::Migration[5.2]
  def change
    create_table :quote_items do |t|
      t.string :name
      t.string :description
      t.string :quantity
      t.string :price

      t.timestamps
    end
  end
end
