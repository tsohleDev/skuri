class ChangeReferenceOfCartProduct < ActiveRecord::Migration[7.0]
  def change
    remove_reference :cart_products, :product, index: true, foreign_key: true
    add_reference :cart_products, :product_color, null: false, foreign_key: true
  end
end
