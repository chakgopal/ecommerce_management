class AddCustomerReftocustomerAddresses < ActiveRecord::Migration[5.2]
  def change
  	t.references :customer, foreign_key: true
  end
end
