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

ActiveRecord::Schema.define(version: 2019_04_03_090337) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
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
    t.string "firstname"
    t.string "lastname"
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "inventory_stocks", force: :cascade do |t|
    t.string "product_id"
    t.string "quantity"
    t.string "min_quantity"
    t.string "min_sale_quantity"
    t.string "max_sale_quantity"
    t.string "is_in_stock"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "total_paid"
    t.string "email_sent"
    t.string "total_invoice"
    t.string "total_cancel"
    t.string "total_refunded"
    t.string "discount_amount"
    t.string "discount_canceled"
    t.string "discount_invoice"
    t.string "discount_refunded"
    t.string "shipping_amount"
    t.string "shipping_canceled"
    t.string "shipping_invoice"
    t.string "shipping_refunded"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "sku"
    t.string "status"
    t.string "short_description"
    t.string "description"
    t.string "price"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_id"
    t.index ["order_id"], name: "index_products_on_order_id"
  end

  create_table "quote_addresses", force: :cascade do |t|
    t.bigint "quote_id"
    t.bigint "customer_id"
    t.string "customer_address_type"
    t.string "email"
    t.string "first_name"
    t.string "post_code"
    t.boolean "same_as_billing"
    t.boolean "free_shipping"
    t.string "shipping_method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_quote_addresses_on_customer_id"
    t.index ["quote_id"], name: "index_quote_addresses_on_quote_id"
  end

  create_table "quote_items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "quantity"
    t.string "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "store_id"
    t.bigint "customer_id"
    t.index ["customer_id"], name: "index_quote_items_on_customer_id"
    t.index ["store_id"], name: "index_quote_items_on_store_id"
  end

  create_table "quote_payments", force: :cascade do |t|
    t.bigint "quote_id"
    t.string "method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quote_id"], name: "index_quote_payments_on_quote_id"
  end

  create_table "quote_shipping_rates", force: :cascade do |t|
    t.bigint "quote_address_id"
    t.string "method"
    t.string "method_description"
    t.string "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quote_address_id"], name: "index_quote_shipping_rates_on_quote_address_id"
  end

  create_table "quotes", force: :cascade do |t|
    t.string "status"
    t.string "item_count"
    t.string "customer_email"
    t.string "customer_firstname"
    t.string "customer_lastname"
    t.string "coupon_code"
    t.string "subtotal"
    t.string "subtotal_with_discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "role"
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
  end

  add_foreign_key "customer_addresses", "customers"
  add_foreign_key "products", "orders"
  add_foreign_key "quote_addresses", "customers"
  add_foreign_key "quote_addresses", "quotes"
  add_foreign_key "quote_items", "customers"
  add_foreign_key "quote_items", "stores"
  add_foreign_key "quote_payments", "quotes"
  add_foreign_key "quote_shipping_rates", "quote_addresses"
end
