class Product < ApplicationRecord
  belongs_to :brand
  has_one_attached :image
  has_many :product_colour_sizes, dependent: :destroy
  has_many :reviews, dependent: :destroy

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
end
