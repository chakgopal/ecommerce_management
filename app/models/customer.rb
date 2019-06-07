class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,  
         :recoverable, :rememberable, :validatable, :registerable
  has_many :customer_addresses

  
  after_create :welcome_email
  def welcome_email
    OrderNotifierMailer.welcome_email(self).deliver_now
  end
end
