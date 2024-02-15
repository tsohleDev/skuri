class Cart < ApplicationRecord
  has_one :customer
  has_many :cart_products, dependent: :destroy
  has_many :product_colors, through: :cart_products

  validates :user_id, presence: true
  validates :total_price, numericality: { greater_than_or_equal_to: 0 }

  def add_product(product_color)
    current_item = cart_products.find_by(product_color_id: product_color.id)

    if current_item
      current_item.increment(:quantity)
    else
      current_item = cart_products.build(product_color_id: product_color.id)
    end

    current_item
  end

  def add_product(product, color, size, size_uk, quantity)
    if size_uk == nil
      product_size = ProductSize.find_by(product_id: product.id, size: size)
    else
      product_size = ProductSize.find_by(product_id: product.id, UK: size_uk)
    end

    product_color = ProductColor.find_by(product_size_id: product_size.id, color: color)
  end

  def set_total_price
    self.total_price = cart_products.to_a.sum { |item| item.total_price }
  end

  def total_items
    cart_products.to_a.sum { |item| item.quantity }
  end
end
