class ProductColourSize < ApplicationRecord
  belongs_to :product
  belongs_to :size
  belongs_to :colour

  has_many_attached :images
end
