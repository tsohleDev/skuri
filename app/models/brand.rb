class Brand < ApplicationRecord
    has_many :products

    validates :name, presence: true, uniqueness: true
    validates :country, presence: true
    validates :description, presence: true
    #validates :image_url, presence: true, uniqueness: true
end
