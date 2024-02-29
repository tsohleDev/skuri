class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Define the relationship between the User and the Cart model
  has_one :cart
  has_one :wishlist
  has_one :adress, as: :addressable # Define the relationship between the User and the Address model 
  has_many :orders

  accepts_nested_attributes_for :adress

  def admin?
    self.admin
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
