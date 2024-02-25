class Wishlist < ApplicationRecord
  belongs_to :user
  has_many :wishlist_products, dependent: :destroy
end

