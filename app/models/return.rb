class Return < ApplicationRecord
  belongs_to :user
  belongs_to :adress
  has_many :return_products, dependent: :destroy
end
