class CreateAdresses < ActiveRecord::Migration[7.1]
  def change
    create_table :adresses do |t|
      t.string :apartment
      t.string :street
      t.string :suburb
      t.string :city
      t.string :province
      t.string :country
      t.integer :postal_code

      t.timestamps
    end
  end
end
