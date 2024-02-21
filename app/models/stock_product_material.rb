class StockProductMaterial < ApplicationRecord
  belongs_to :material
  belongs_to :stock_product
end
