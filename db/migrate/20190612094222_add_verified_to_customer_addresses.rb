class AddVerifiedToCustomerAddresses < ActiveRecord::Migration[5.2]
  def change
     add_column :customer_addresses, :verified, :boolean, default: false
  end
end
