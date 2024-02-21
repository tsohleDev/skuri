class StockProductColour < ApplicationRecord
  belongs_to :colour
  belongs_to :stock_product
end
