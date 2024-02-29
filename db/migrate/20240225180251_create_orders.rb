class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :adress, null: false, foreign_key: true
      t.decimal :cost

      t.timestamps
    end
  end
end
