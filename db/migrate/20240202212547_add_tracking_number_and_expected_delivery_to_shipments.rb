class AddTrackingNumberAndExpectedDeliveryToShipments < ActiveRecord::Migration[7.0]
  def change
    add_column :shipments, :tracking_number, :string
    add_column :shipments, :expected_delivery, :date
  end
end
