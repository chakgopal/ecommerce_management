class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :shop_name
      t.string :shop_image
      t.string :website_url
      t.string :company_email
      t.string :shop_intro
      t.string :gst_image
      t.string :shop_pan_image
      t.string :trade_license_image
      t.string :iso_image
      t.string :landmark
      t.string :address1
      t.string :address2
      t.string :shop_phone_no
      t.string :alternative_phone_no1
      t.string :alternative_phone_no2
      t.string :certificate_of_incorporation
      t.string :trademark_registration
      t.string :address_proff
      t.string :working_hour_to
      t.string :working_hour_from
      t.string :working_date_to
      t.string :working_date_from

      t.timestamps
    end
  end
end
