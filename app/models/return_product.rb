class ReturnProduct < ApplicationRecord
  belongs_to :return
  belongs_to :product_flavour, optional: true
  belongs_to :product_colour_size, optional: true
end
