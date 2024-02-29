class Product < ApplicationRecord
  belongs_to :brand
  has_one_attached :image
  has_many :product_colour_sizes, dependent: :destroy
  has_many :colours, through: :product_colour_sizes
  has_many :sizes, through: :product_colour_sizes
  has_many :reviews, dependent: :destroy
  has_many :product_ingredients, dependent: :destroy
  has_many :product_materials, dependent: :destroy
  has_many :product_flavours, dependent: :destroy
  has_many :product_categories, dependent: :destroy
  belongs_to :category, optional: true

  validates :name, presence: true

  def self.search(search)
    if search
      where("name LIKE ?", "%#{search}%")
    else
      all
    end
  end

  def brand_name
    brand.name if brand
  end

  def price
    # random price bw 100 to 1000
    rand(1030..5670)
  end

  def related_products
    Product.where(brand_id: brand_id).except(:id, id).limit(4)
  end

  def self.ransackable_attributes(auth_object = nil)
    ["brand_id", "created_at", "description", "id", "name", "updated_at"]
  end
end
