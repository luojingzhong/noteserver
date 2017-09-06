class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :notebook_id
      t.integer :user_id
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
