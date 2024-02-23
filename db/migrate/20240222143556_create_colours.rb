class CreateColours < ActiveRecord::Migration[7.1]
  def change
    create_table :colours do |t|
      t.string :name
      t.text :description
      t.string :hex

      t.timestamps
    end
  end
end
