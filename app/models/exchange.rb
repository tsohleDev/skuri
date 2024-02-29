class Exchange < ApplicationRecord
  belongs_to :user
  belongs_to :adress
  has_many :exchange_products, dependent: :destroy
end
