class Product < ApplicationRecord
  has_many :category_products, dependent: :destroy
  has_many :categories, through: :category_products, dependent: :destroy
  belongs_to :brand

  has_many :product_materials, dependent: :destroy
  has_many :product_sizes, dependent: :destroy
  has_many :product_colors, through: :product_sizes, dependent: :destroy

  has_many :reviews, dependent: :destroy
  has_many :wishlist_products, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_many :cart_products, through: :product_colors, dependent: :destroy
  has_many :carts, through: :cart_products, dependent: :destroy
  has_many :wishlists, through: :wishlist_products, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 50, maximum: 1000 }

  def image_urls
    product_colors.map { |color| color.image_url }
  end

  def price
    product_colors.map { |color| color.price }.min
  end

  def stock
    product_colors.map { |color| color.stock }.sum
  end

  def colors
    product_colors
  end

  def sizes
    product_sizes
  end

  def sizes_in_stock
    product_sizes.map { |size| size if size.stock > 0 }.compact
  end

  def materials
    product_materials.map { |material| material.material }.uniq
  end

  def brand_name
    brand.name
  end

  def category_name
    categories.map { |category| category.name }.uniq
  end

  def average_rating
    reviews.average(:rating).to_f
  end
end
