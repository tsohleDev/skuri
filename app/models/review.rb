class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many_attached :images
end
