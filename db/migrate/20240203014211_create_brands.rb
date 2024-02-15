class CreateBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :brands do |t|
      t.string :name
      t.text :description
      t.text :image_url
      t.string :founders
      t.string :country
      t.date :established_at

      t.timestamps
    end
  end
end
