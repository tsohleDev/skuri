class CreateHelpMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :help_messages do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :message

      t.timestamps
    end
  end
end
