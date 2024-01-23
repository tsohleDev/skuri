class Shipment < ApplicationRecord
  belongs_to :order
  belongs_to :user

  validates :order_id, :customer_id, :status, :address, :city, :state, :zip, presence: true
  validates :status, inclusion: { in: %w[ordered paid cancelled complete shipped] }
  validates :zip, length: { is: 5 }
  validates :state, length: { is: 2 }
  validates :address1, length: { minimum: 3, maximum: 50 }
  validates :address2, length: { minimum: 3, maximum: 50 }
  validates :city, length: { minimum: 3, maximum: 50 }
  validates :country, length: { minimum: 3, maximum: 50 }
end
