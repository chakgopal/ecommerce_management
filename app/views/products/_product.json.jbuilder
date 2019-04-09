json.extract! product, :id, :name, :sku, :status, :short_desc, :long_desc, :price, :color, :store, :created_at, :updated_at
json.url product_url(product, format: :json)
