class CreateReturns < ActiveRecord::Migration[7.1]
  def change
    create_table :returns do |t|
      t.references :user, null: false, foreign_key: true
      t.references :adress, null: false, foreign_key: true
      t.decimal :refund

      t.timestamps
    end
  end
end
