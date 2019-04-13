json.extract! quote_item, :id, :sku, :name, :description, :quantity, :price, :quote_id, :product_id, :store_id, :created_at, :updated_at
json.url quote_item_url(quote_item, format: :json)
