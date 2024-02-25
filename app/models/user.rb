class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Define the relationship between the User and the Cart model
  has_one :cart
  has_one :wishlist

  def admin?
    self.admin
  end
end
