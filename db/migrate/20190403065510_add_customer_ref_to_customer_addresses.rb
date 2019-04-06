class AddCustomerRefToCustomerAddresses < ActiveRecord::Migration[5.2]
  def change
    add_reference :customer_addresses, :customer, foreign_key: true
  end
end
