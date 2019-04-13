class Store < ApplicationRecord
  belongs_to :seller ,required: false
  has_many :products, dependent: :destroy

  has_many_attached :shop_images
  has_one_attached :gst_image
  has_one_attached :shop_pan_image
  has_one_attached :trade_license_image
  has_one_attached :iso_image
  has_one_attached :certificate_of_incorporation
  has_one_attached :trademark_registration
  has_one_attached :address_proff
end
