class ProductColourSize < ApplicationRecord
  belongs_to :product
  belongs_to :size
  belongs_to :colour

  has_many_attached :images

  def name
    product.name
  end

  def image
    images.first
  end

  def price
    product.price
  end
end
