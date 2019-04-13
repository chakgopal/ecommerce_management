class AddNamesToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :firstname, :string
    add_column :customers, :lastname, :string
  end
end
