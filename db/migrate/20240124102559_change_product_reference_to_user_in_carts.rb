class ChangeProductReferenceToUserInCarts < ActiveRecord::Migration[7.0]
  def change
     # Remove the existing product reference
    remove_reference :carts, :product, foreign_key: true

    # Add a new user reference
    add_reference :carts, :user, null: false, foreign_key: true
  end
end
