json.extract! customer_address, :id, :address1, :address2, :city, :state, :postalcode, :country, :phone1, :phone2, :created_at, :updated_at
json.url customer_address_url(customer_address, format: :json)
