class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :status, inclusion: { in: %w[paid cancelled delivered shipped collected returned] }
end
