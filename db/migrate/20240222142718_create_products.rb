class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.references :brand, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
