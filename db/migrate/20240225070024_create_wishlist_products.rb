class CreateWishlistProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :wishlist_products do |t|
      t.references :wishlist, null: false, foreign_key: true
      t.references :product_flavour, foreign_key: true
      t.references :product_colour_size, foreign_key: true

      t.timestamps
    end
  end
end
