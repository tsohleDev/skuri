class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.references :parent, foreign_key: { to_table: :categories }

      t.timestamps
    end
  end
end
