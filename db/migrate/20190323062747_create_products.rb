class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku
      t.string :status
      t.string :short_description
      t.string :description
      t.string :price
      t.string :image

      t.timestamps
    end
  end
end
