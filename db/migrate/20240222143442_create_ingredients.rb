class CreateIngredients < ActiveRecord::Migration[7.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.text :description
      t.string :source

      t.timestamps
    end
  end
end
