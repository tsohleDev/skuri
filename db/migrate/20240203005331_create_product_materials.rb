class CreateProductMaterials < ActiveRecord::Migration[7.0]
  def change
    create_table :product_materials do |t|
      t.references :product, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.text :cleaning

      t.timestamps
    end
  end
end
