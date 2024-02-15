class CreateProductColors < ActiveRecord::Migration[7.0]
  def change
    create_table :product_colors do |t|
      t.references :product_sizes, null: false, foreign_key: true
      t.string :color
      t.text :image_url
      t.integer :stock

      t.timestamps
    end
  end
end
