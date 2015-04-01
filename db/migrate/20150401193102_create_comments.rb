class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment
      t.integer :mircoblog_id
      t.integer :photo_id
      t.integer :user_id
      t.timestamps
    end
  end
end
