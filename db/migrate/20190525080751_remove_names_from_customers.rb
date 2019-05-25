class RemoveNamesFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :firstname, :string
    remove_column :customers, :lastname, :string
  end
end
