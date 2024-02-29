class Category < ApplicationRecord
  belongs_to :parent, class_name: "Category", optional: true
  has_many :product_categories
  has_many :products, through: :product_categories

  has_one_attached :image
end

