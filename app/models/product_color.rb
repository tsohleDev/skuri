class ProductColor < ApplicationRecord
  belongs_to :product_size

  has_many :cart_products, dependent: :destroy
  has_many :carts, through: :cart_products, dependent: :destroy
  has_many :product_color_images, dependent: :destroy

  validates :stock, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  def name
    product_size.product.name
  end

  def description
    product_size.product.description
  end

  def reviews
    product_size.product.reviews
  end

  def price
    product_size.price
  end

  def size
    product_size.size
  end

  def size_uk
    product_size.UK
  end

  def sizes 
    product_size.product.sizes.map { |size| size.size || size.UK }
  end

  def sizes_with_stock
    product_size.product.sizes.map { |size| [size.size || size.UK, size.stock] }
  end

  def brand
    product_size.product.brand
  end

  def image_urls
    product_color_images.map { |image| image.image_url }
  end

  def image_url
    product_color_images.first.image_url
  end

  def materials
    product_size.product.materials
  end
end
