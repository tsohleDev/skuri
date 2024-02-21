class CreateStockProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :stock_products do |t|
      t.references :product, null: false, foreign_key: true
      t.references :size, null: false, foreign_key: true
      t.integer :stock
      t.decimal :price

      t.timestamps
    end
  end
end
