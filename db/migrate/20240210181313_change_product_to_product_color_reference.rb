class ChangeProductToProductColorReference < ActiveRecord::Migration[7.0]
  def change
    remove_reference :order_products, :product, null: false, foreign_key: true
    add_reference :order_products, :product_color, null: false, foreign_key: true
  end
end
