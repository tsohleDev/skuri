class RemoveNameFromProductMaterial < ActiveRecord::Migration[7.0]
  def change
    remove_column :product_materials, :name, :string
  end
end
