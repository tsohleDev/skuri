class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.references :category, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.string :image_url

      t.timestamps
    end
  end
end
