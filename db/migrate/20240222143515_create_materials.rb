class CreateMaterials < ActiveRecord::Migration[7.1]
  def change
    create_table :materials do |t|
      t.string :name
      t.text :description
      t.string :youtube_link
      t.string :cleaning_instructions

      t.timestamps
    end
  end
end
