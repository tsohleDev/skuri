class CreateShipments < ActiveRecord::Migration[7.1]
  def change
    create_table :shipments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :adress, null: false, foreign_key: true
      t.string :shipment_service
      t.string :tracking_number
      t.date :expected_delevery

      t.timestamps
    end
  end
end
