class RemoveSizeAndColorFromProduct < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :dimensions, :string
    remove_column :products, :color, :string
    remove_column :products, :stock, :integer
    remove_column :products, :category_id, :integer
    remove_column :products, :price, :decimal
    remove_column :products, :image, :string

    add_column :products, :material, :string, null: false
  end
end
