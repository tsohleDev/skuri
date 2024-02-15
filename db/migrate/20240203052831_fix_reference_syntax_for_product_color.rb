class FixReferenceSyntaxForProductColor < ActiveRecord::Migration[7.0]
  def change
    remove_reference :product_colors, :product_sizes, index: true, foreign_key: true
    add_reference :product_colors, :product_size, null: false, foreign_key: true
  end
end
