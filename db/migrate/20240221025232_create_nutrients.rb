class CreateNutrients < ActiveRecord::Migration[7.1]
  def change
    create_table :nutrients do |t|
      t.string :name
      t.text :description
      t.decimal :amount_per_serving
      t.decimal :daily_value

      t.timestamps
    end
  end
end
