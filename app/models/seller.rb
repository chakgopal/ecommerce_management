class Seller < ApplicationRecord
  enum role: [:owner, :manager, :employee]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :employee
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :stores,  dependent: :destroy
  has_many :products, dependent: :destroy
end

  
