class AddCountryToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :country, :string
  end
end
