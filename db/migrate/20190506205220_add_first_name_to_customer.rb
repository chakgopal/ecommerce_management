class AddFirstNameToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :first_name, :string
  end
end
