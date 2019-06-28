class AddFieldsToOrderAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :order_addresses, :customer_address_type, :string
    add_column :order_addresses, :same_as_billing, :string
    add_column :order_addresses, :free_shipping, :string
    add_column :order_addresses, :shipping_method, :string
    add_reference :order_addresses, :quote, foreign_key: true
    add_reference :order_addresses, :customer, foreign_key: true
   
  end
end
