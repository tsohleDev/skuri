class CreateProductColorImages < ActiveRecord::Migration[7.0]
  def change
    create_table :product_color_images do |t|
      t.references :product_color, null: false, foreign_key: true
      t.text :image_url

      t.timestamps
    end
  end
end
