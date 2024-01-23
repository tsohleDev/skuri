class RemoveForeignKeyConstraintFromCategories < ActiveRecord::Migration[7.0]
  def change
    change_column :categories, :category_id, :integer, null: true
  end
end
