class StockProductNutrient < ApplicationRecord
  belongs_to :nutrient
  belongs_to :stock_product
end
