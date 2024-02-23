class Category < ApplicationRecord
  belongs_to :parent, class_name: "Category", optional: true

  has_many :products
  has_one_attached :image
end

