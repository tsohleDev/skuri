class Colour < ApplicationRecord
  has_many :product_colour_sizes

  def sizes
    product_colour_sizes.where(colour_id: id).sizes
  end
end
