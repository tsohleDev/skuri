class ChangeProductToProductMaterialReference < ActiveRecord::Migration[7.0]
  def change
    remove_reference :product_sizes, :product, index: true, foreign_key: true
    add_reference :product_sizes, :product_material, null: false, foreign_key: true
  end
end
