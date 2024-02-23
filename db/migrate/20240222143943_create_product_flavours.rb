class CreateProductFlavours < ActiveRecord::Migration[7.1]
  def change
    create_table :product_flavours do |t|
      t.references :product, null: false, foreign_key: true
      t.references :flavour, null: false, foreign_key: true

      t.timestamps
    end
  end
end
