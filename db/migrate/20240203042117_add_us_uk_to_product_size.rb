class AddUsUkToProductSize < ActiveRecord::Migration[7.0]
  def change
    add_column :product_sizes, :US, :integer
    add_column :product_sizes, :UK, :integer
    add_column :product_sizes, :EU, :integer
    add_column :product_sizes, :CM, :integer
  end
end
