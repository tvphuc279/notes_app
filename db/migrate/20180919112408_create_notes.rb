class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :content
      t.integer :user_id

      t.timestamps
    end
    add_index :notes, :user_id
    add_foreign_key :notes, :users
  end
end
