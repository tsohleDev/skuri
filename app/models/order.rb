class Order < ApplicationRecord
  belongs_to :user
  belongs_to :adress
  has_many :order_products, dependent: :destroy
end
