class CreateStockProductColours < ActiveRecord::Migration[7.1]
  def change
    create_table :stock_product_colours do |t|
      t.references :colour, null: false, foreign_key: true
      t.references :stock_product, null: false, foreign_key: true
      t.boolean :dominant_colour

      t.timestamps
    end
  end
end
