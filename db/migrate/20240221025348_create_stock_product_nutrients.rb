class CreateStockProductNutrients < ActiveRecord::Migration[7.1]
  def change
    create_table :stock_product_nutrients do |t|
      t.references :nutrient, null: false, foreign_key: true
      t.references :stock_product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
