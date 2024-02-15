class AddJobToShipment < ActiveRecord::Migration[7.0]
  def change
    add_column :shipments, :job, :string, default: "delivery", null: false
  end
end
