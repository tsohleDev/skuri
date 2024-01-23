class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :customer_id, :product_id, :rating, :title, :description, presence: true
  validates :rating, inclusion: { in: 1..5 }
  validates :title, length: { minimum: 3, maximum: 50 }
  validates :description, length: { minimum: 3, maximum: 1000 }
end
