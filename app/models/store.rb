class Store < ApplicationRecord
  belongs_to :seller ,required: false
<<<<<<< HEAD
  has_many :products, dependent: :destroy

=======
  
>>>>>>> 8021deac63898c83d1458658be45a612d459e724
  has_one_attached :shop_image
  has_one_attached :gst_image
  has_one_attached :shop_pan_image
  has_one_attached :trade_license_image
  has_one_attached :iso_image
  has_one_attached :certificate_of_incorporation
  has_one_attached :trademark_registration
  has_one_attached :address_proff
end
