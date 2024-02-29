class ShipmentProduct < ApplicationRecord
  belongs_to :shipment
  belongs_to :product_flavour, optional: true
  belongs_to :product_colour_size, optional: true
end
