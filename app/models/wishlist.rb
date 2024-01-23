class Wishlist < ApplicationRecord
  has_one :user

  has_many :wishlist_products, dependent: :destroy
  has_many :products, through: :wishlist_products

  validates :customer_id, presence: true
end
