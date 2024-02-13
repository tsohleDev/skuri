class Order < ApplicationRecord
  belongs_to :user
  has_one :shipment, dependent: :destroy

  has_many :order_products, dependent: :destroy
  has_many :product_colors, through: :order_products

  validates :user_id, :cost, presence: true
  validates :cost, numericality: { greater_than_or_equal_to: 0 }

end
