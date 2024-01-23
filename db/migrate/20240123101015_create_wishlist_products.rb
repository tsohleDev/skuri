class CreateWishlistProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :wishlist_products do |t|
      t.references :wishlist, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
