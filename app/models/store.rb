class Store < ApplicationRecord
  enum status: [:active, :inactive]
  after_initialize :set_default_status, :if => :new_record?

  def set_default_status
    self.status ||= :active
  end

  belongs_to :seller ,required: false
  has_many :products, dependent: :destroy
  has_many :quote_items, dependent: :destroy
  has_many :inventory_stocks, dependent: :destroy

  has_many_attached :images
  has_one_attached :gst_image
  has_one_attached :shop_pan_image
  has_one_attached :trade_license_image
  has_one_attached :iso_image
  has_one_attached :certificate_image
  has_one_attached :address_proff_image
  has_one_attached :trade_mark_image
  
end
