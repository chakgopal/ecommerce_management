json.extract! order, :id, :total_paid, :email_sent, :total_invoice, :total_cancel, :total_refunded, :discount_amount, :discount_cancelled, :discount_invoice, :discount_refunded, :shipping_amount, :shipping_invoice, :shipping_refunded, :created_at, :updated_at
json.url order_url(order, format: :json)
