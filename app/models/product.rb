class Product < ApplicationRecord
  enum color: [:white, :red, :yellow, :green, :blue, :black]
  enum status: [:active, :inactive]
  after_initialize :set_default_status, :if => :new_record?

  def set_default_status
    self.status ||= :active
  end

  belongs_to :store, required: false
  belongs_to :seller, required: false
  has_many_attached :images

  has_many :orders
  paginates_per 2

  

end
