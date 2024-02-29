class AddStatusToOrderProduct < ActiveRecord::Migration[7.1]
  def change
    add_column :order_products, :status, :string, default: 'paid'
  end
end
