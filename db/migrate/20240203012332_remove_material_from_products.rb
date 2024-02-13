class RemoveMaterialFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :material, :string
  end
end
