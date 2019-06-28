class AddCountryCodeToCustomerAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :customer_addresses, :country_code, :string
  end
end
