class CreateCustomerAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_addresses do |t|
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :postalcode
      t.string :country
      t.string :phone1
      t.string :phone2

      t.timestamps
    end
  end
end
