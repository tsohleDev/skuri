class Cart < ApplicationRecord
  has_one :customer
  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products

  validates :user_id, presence: true
  validates :total_price, numericality: { greater_than_or_equal_to: 0 }
end
