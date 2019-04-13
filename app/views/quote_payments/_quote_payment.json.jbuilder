json.extract! quote_payment, :id, :method, :quote_id, :created_at, :updated_at
json.url quote_payment_url(quote_payment, format: :json)
