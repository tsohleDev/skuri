class ProductColorImage < ApplicationRecord
  belongs_to :product_color

  validates :image_url, presence: true
end
