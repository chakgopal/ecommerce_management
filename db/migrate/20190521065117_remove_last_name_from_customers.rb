class RemoveLastNameFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :last_name, :string
  end
end
