class WishlistProduct < ApplicationRecord
  belongs_to :wishlist
  belongs_to :product_flavour, optional: true
  belongs_to :product_colour_size, optional: true

  def name
    if product_flavour.present?
      product_flavour.name
    else
      product_colour_size.name
    end
  end

  def image
    if product_flavour.present?
      product_flavour.image
    else
      product_colour_size.image
    end
  end
  
  def price
    if product_flavour.present?
      product_flavour.price
    else
      product_colour_size.price
    end
  end

  def size
    product_colour_size.size.get_size
  end
end
