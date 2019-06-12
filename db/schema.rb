# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_06_10_150917) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_categories_on_category_id"
  end

  create_table "categorizations", force: :cascade do |t|
    t.integer "product_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customer_addresses", force: :cascade do |t|
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "postalcode"
    t.string "country"
    t.string "phone1"
    t.string "phone2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id"
    t.index ["customer_id"], name: "index_customer_addresses_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "inventory_stocks", force: :cascade do |t|
    t.string "quantity"
    t.string "min_quantity"
    t.string "min_sale_quantity"
    t.string "max_sale_quantity"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id"
    t.integer "is_in_stock"
    t.index ["product_id"], name: "index_inventory_stocks_on_product_id"
  end

  create_table "order_addresses", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "customer_address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_address_id"], name: "index_order_addresses_on_customer_address_id"
    t.index ["order_id"], name: "index_order_addresses_on_order_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sku"
    t.string "name"
    t.string "description"
    t.integer "quantity"
    t.integer "price"
    t.bigint "product_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
    t.index ["store_id"], name: "index_order_items_on_store_id"
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "total_paid", precision: 5, scale: 2
    t.string "email_sent"
    t.integer "total_invoice"
    t.integer "total_cancel"
    t.integer "total_refunded"
    t.decimal "discount_amount", precision: 5, scale: 2
    t.decimal "discount_cancelled", precision: 5, scale: 2
    t.decimal "discount_invoice", precision: 5, scale: 2
    t.decimal "discount_refunded", precision: 5, scale: 2
    t.decimal "shipping_amount", precision: 5, scale: 2
    t.string "shipping_invoice"
    t.decimal "shipping_refunded", precision: 5, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "sku"
    t.integer "status"
    t.string "short_desc"
    t.string "long_desc"
    t.decimal "price", precision: 7, scale: 2
    t.integer "color"
    t.bigint "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "deleted_flag"
    t.bigint "seller_id"
    t.index ["seller_id"], name: "index_products_on_seller_id"
    t.index ["store_id"], name: "index_products_on_store_id"
  end

  create_table "quote_addresses", force: :cascade do |t|
    t.string "customer_address_type"
    t.string "same_as_billing"
    t.string "free_shipping"
    t.string "shipping_method"
    t.bigint "quote_id"
    t.bigint "customer_id"
    t.bigint "customer_address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_address_id"], name: "index_quote_addresses_on_customer_address_id"
    t.index ["customer_id"], name: "index_quote_addresses_on_customer_id"
    t.index ["quote_id"], name: "index_quote_addresses_on_quote_id"
  end

  create_table "quote_items", force: :cascade do |t|
    t.string "sku"
    t.string "name"
    t.string "description"
    t.integer "quantity"
    t.decimal "price", precision: 5, scale: 2
    t.bigint "quote_id"
    t.bigint "product_id"
    t.bigint "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_quote_items_on_product_id"
    t.index ["quote_id"], name: "index_quote_items_on_quote_id"
    t.index ["store_id"], name: "index_quote_items_on_store_id"
  end

  create_table "quote_payments", force: :cascade do |t|
    t.string "method"
    t.bigint "quote_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quote_id"], name: "index_quote_payments_on_quote_id"
  end

  create_table "quote_shipping_rates", force: :cascade do |t|
    t.string "method_description"
    t.decimal "price", precision: 5, scale: 2
    t.bigint "quote_payment_id"
    t.bigint "quote_address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quote_address_id"], name: "index_quote_shipping_rates_on_quote_address_id"
    t.index ["quote_payment_id"], name: "index_quote_shipping_rates_on_quote_payment_id"
  end

  create_table "quotes", force: :cascade do |t|
    t.integer "item_count"
    t.decimal "grand_total", precision: 5, scale: 2
    t.string "coupon_code"
    t.decimal "subtotal_with_discount", precision: 5, scale: 2
    t.bigint "store_id"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.bigint "product_id"
    t.integer "item_quantity", default: 1
    t.integer "subtotal"
    t.index ["customer_id"], name: "index_quotes_on_customer_id"
    t.index ["product_id"], name: "index_quotes_on_product_id"
    t.index ["store_id"], name: "index_quotes_on_store_id"
  end

  create_table "sellers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "role"
    t.index ["email"], name: "index_sellers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_sellers_on_reset_password_token", unique: true
  end

  create_table "stores", force: :cascade do |t|
    t.string "shop_name"
    t.string "shop_image"
    t.string "website_url"
    t.string "company_email"
    t.string "shop_intro"
    t.string "gst_image"
    t.string "shop_pan_image"
    t.string "trade_license_image"
    t.string "iso_image"
    t.string "landmark"
    t.string "address1"
    t.string "address2"
    t.string "shop_phone_no"
    t.string "alternative_phone_no1"
    t.string "alternative_phone_no2"
    t.string "certificate_of_incorporation"
    t.string "trademark_registration"
    t.string "address_proff"
    t.string "working_hour_to"
    t.string "working_hour_from"
    t.string "working_date_to"
    t.string "working_date_from"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "seller_id"
    t.boolean "deleted_flag"
    t.bigint "quote_item_id"
    t.integer "status"
    t.index ["quote_item_id"], name: "index_stores_on_quote_item_id"
    t.index ["seller_id"], name: "index_stores_on_seller_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "categories", "categories"
  add_foreign_key "customer_addresses", "customers"
  add_foreign_key "inventory_stocks", "products"
  add_foreign_key "order_addresses", "customer_addresses"
  add_foreign_key "order_addresses", "orders"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "order_items", "stores"
  add_foreign_key "orders", "customers"
  add_foreign_key "products", "sellers"
  add_foreign_key "quote_addresses", "customer_addresses"
  add_foreign_key "quote_addresses", "customers"
  add_foreign_key "quote_addresses", "quotes"
  add_foreign_key "quote_items", "products"
  add_foreign_key "quote_items", "quotes"
  add_foreign_key "quote_items", "stores"
  add_foreign_key "quote_payments", "quotes"
  add_foreign_key "quote_shipping_rates", "quote_addresses"
  add_foreign_key "quote_shipping_rates", "quote_payments"
  add_foreign_key "quotes", "customers"
  add_foreign_key "quotes", "products"
  add_foreign_key "quotes", "stores"
  add_foreign_key "stores", "quote_items"
  add_foreign_key "stores", "sellers"
end
