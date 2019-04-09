class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku
      t.integer :status
      t.string :short_desc
      t.string :long_desc
      t.decimal :price, precision: 7, scale: 2
      t.integer :color
      t.references :store

      t.timestamps
    end
  end
end
