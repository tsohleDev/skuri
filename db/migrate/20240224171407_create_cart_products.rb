class CreateCartProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :cart_products do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :product_flavour, foreign_key: true
      t.references :product_colour_size, foreign_key: true
      t.integer :quantity, default: 1

      t.timestamps
    end
  end
end
