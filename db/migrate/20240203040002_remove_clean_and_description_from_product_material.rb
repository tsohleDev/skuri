class RemoveCleanAndDescriptionFromProductMaterial < ActiveRecord::Migration[7.0]
  def change
    remove_column :product_materials, :cleaning, :string
    remove_column :product_materials, :description, :string

    add_reference :product_materials, :material, null: false, foreign_key: true
  end
end
