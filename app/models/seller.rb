class Seller < ApplicationRecord
  enum role: [:owner, :manager, :employee]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :employee
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :stores,  dependent: :destroy
  has_many :products, dependent: :destroy
  paginates_per 2

  #def after_confirmation
    #registration_email
  #end

  #def registration_email
    #SellerMailer.registration_email(self).deliver
  #end

end

  
