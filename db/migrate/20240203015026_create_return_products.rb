class CreateReturnProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :return_products do |t|
      t.references :return, null: false, foreign_key: true
      t.references :product_color, null: false, foreign_key: true
      t.text :reason
      t.string :direction

      t.timestamps
    end
  end
end
