class AddStockToProductSize < ActiveRecord::Migration[7.0]
  def change
    add_column :product_sizes, :stock, :integer, default: 0, null: false
    remove_column :product_colors, :stock
  end
end
