class Product < ApplicationRecord
  belongs_to :category

  has_many :reviews, dependent: :destroy
  has_many :cart_products, dependent: :destroy
  has_many :wishlist_products, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_many :carts, through: :cart_products
  has_many :wishlists, through: :wishlist_products

  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 50, maximum: 1000 }
  validates :image, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :stock, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
