class AddAdressToUser < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :adress, foreign_key: true
  end
end
