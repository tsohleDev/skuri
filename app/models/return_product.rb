class ReturnProduct < ApplicationRecord
  belongs_to :return
  belongs_to :product_color

  validates :reason, presence: true, length: { minimum: 50, maximum: 1000 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :status, presence: true, inclusion: { in: %w[requested approved rejected] }
  validates :direction, presence: true, inclusion: { in: %w[returning requested] }
end
