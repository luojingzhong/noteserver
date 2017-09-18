class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.string :title
      t.text :content,default: ''
      t.integer :note_id

      t.timestamps null: false
    end
  end
end
