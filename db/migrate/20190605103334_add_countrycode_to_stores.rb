class AddCountrycodeToStores < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :countrycode, :string
  end
end
