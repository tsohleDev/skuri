class WishlistProduct < ApplicationRecord
  belongs_to :wishlist
  belongs_to :product_flavour
  belongs_to :product_colour_size
end
