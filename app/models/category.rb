class Category < ApplicationRecord
  has_many :category_products, dependent: :destroy
  has_many :products, through: :category_products, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 50, maximum: 1000 }
  validates :image_url, presence: true

  def self.sample_categories
    # randomly select 3 categories
    Category.all.sample(2)
  end
end
