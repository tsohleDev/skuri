class ProductSize < ApplicationRecord
  belongs_to :product

  has_many :product_colors, dependent: :destroy

  # at least one of the following must be present
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def stock
    product_colors.map { |color| color.stock }.sum
  end
end
