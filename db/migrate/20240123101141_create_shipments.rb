class CreateShipments < ActiveRecord::Migration[7.0]
  def change
    create_table :shipments do |t|
      t.references :order, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :shipment_service

      t.timestamps
    end
  end
end
