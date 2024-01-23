class Order < ApplicationRecord
  belongs_to :user
  has_one :shipment, dependent: :destroy

  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  validates :customer_id, :status, :total_price, presence: true
  validates :status, inclusion: { in: %w[ordered paid cancelled complete shipped] }
  validates :total_price, numericality: { greater_than_or_equal_to: 0 }
end
