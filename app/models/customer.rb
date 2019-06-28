class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,  
         :recoverable, :rememberable, :validatable, :registerable, :confirmable
  has_many :customer_addresses

  
  #after_create :welcome_email
  #def welcome_email
    #OrderNotifierMailer.welcome_email(self).deliver_now
  #end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :customer_addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
end
