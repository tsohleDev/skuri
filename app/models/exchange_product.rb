class ExchangeProduct < ApplicationRecord
  belongs_to :exchange
  belongs_to :product_flavour, optional: true
  belongs_to :product_colour_size, optional: true
end
