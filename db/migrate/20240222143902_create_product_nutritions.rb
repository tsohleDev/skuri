class CreateProductNutritions < ActiveRecord::Migration[7.1]
  def change
    create_table :product_nutritions do |t|
      t.references :product, null: false, foreign_key: true
      t.references :nutrition, null: false, foreign_key: true

      t.timestamps
    end
  end
end
