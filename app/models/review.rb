class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :user_id, :product_id, :rating, :message, presence: true
  validates :rating, inclusion: { in: 1..5 }
  validates :message, length: { minimum: 3, maximum: 1000 }
end
