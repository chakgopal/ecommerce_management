class RemoveFirstNameFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :first_name, :string
  end
end
