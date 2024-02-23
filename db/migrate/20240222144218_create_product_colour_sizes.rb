class CreateProductColourSizes < ActiveRecord::Migration[7.1]
  def change
    create_table :product_colour_sizes do |t|
      t.references :product, null: false, foreign_key: true
      t.references :size, null: false, foreign_key: true
      t.references :colour, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
