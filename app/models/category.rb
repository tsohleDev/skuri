class Category < ApplicationRecord
  has_and_belongs_to_many :products, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 50, maximum: 1000 }
  validates :image_url, presence: true

  def self.first_three
    # randomly select 3 categories
    Category.all.sample(3)
  end
end
