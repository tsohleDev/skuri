class CreateProductColoSizes < ActiveRecord::Migration[7.0]
  def change
    create_table :product_colo_sizes do |t|
      t.references :product_color, null: false, foreign_key: true
      t.references :product_size, null: false, foreign_key: true

      t.timestamps
    end
  end
end
