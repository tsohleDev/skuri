class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 50, maximum: 1000 }
  validates :image_url, presence: true
end
