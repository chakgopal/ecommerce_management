json.extract! quote, :id, :status, :item_count, :item_quantity, :grand_total, :coupon_code, :subtotal, :subtotal_with_discount, :store_id, :customer_id, :created_at, :updated_at
json.url quote_url(quote, format: :json)
