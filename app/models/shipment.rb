class Shipment < ApplicationRecord
  belongs_to :user
  belongs_to :adress
  has_many :shipment_products, dependent: :destroy
end
