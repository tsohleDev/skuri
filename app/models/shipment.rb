class Shipment < ApplicationRecord
  belongs_to :order
  belongs_to :user

  validates :order_id, :user_id, :tracking_number, :expected_delivery, :shipment_service, :job, presence: true
  validates :tracking_number, uniqueness: true
  #validates :expected_delivery, date: { after: Date.today }
  validates :job, inclusion: { in: %w[delivery collection] }
end
