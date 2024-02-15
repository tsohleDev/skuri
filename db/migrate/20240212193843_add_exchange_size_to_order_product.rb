class AddExchangeSizeToOrderProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :order_products, :exchange_size, :string
  end
end
