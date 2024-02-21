class StockProductFlavour < ApplicationRecord
  belongs_to :flavour
  belongs_to :stock_product
end
