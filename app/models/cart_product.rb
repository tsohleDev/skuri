class CartProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product_color

  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def total_price
    product_color.price * quantity
  end
end
