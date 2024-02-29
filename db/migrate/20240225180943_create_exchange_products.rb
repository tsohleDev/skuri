class CreateExchangeProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :exchange_products do |t|
      t.references :exchange, null: false, foreign_key: true
      t.references :product_flavour, foreign_key: true
      t.references :product_colour_size, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
