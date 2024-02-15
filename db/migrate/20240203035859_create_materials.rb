class CreateMaterials < ActiveRecord::Migration[7.0]
  def change
    create_table :materials do |t|
      t.string :name
      t.text :description
      t.text :cleaning_instructions
      t.text :youtube_link

      t.timestamps
    end
  end
end
