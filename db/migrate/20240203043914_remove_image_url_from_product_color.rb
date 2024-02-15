class RemoveImageUrlFromProductColor < ActiveRecord::Migration[7.0]
  def change
    remove_column :product_colors, :image_url, :string
  end
end
