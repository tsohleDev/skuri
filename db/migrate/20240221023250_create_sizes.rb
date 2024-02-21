class CreateSizes < ActiveRecord::Migration[7.1]
  def change
    create_table :sizes do |t|
      t.string :size
      t.decimal :cm
      t.integer :UK

      t.timestamps
    end
  end
end
