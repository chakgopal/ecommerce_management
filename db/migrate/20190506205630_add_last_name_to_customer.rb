class AddLastNameToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :last_name, :string
  end
end
