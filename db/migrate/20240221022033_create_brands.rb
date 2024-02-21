class CreateBrands < ActiveRecord::Migration[7.1]
  def change
    create_table :brands do |t|
      t.string :name
      t.text :description
      t.date :established_at
      t.string :founders
      t.string :country

      t.timestamps
    end
  end
end
