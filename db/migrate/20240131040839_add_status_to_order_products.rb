class AddStatusToOrderProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :order_products, :status, :string
  end
end
