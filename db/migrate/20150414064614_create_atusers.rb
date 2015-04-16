class CreateAtusers < ActiveRecord::Migration
  def change
    create_table :atusers do |t|
      t.integer :mircoblog_id
      t.integer :comment_id
      t.integer :from_user_id
      t.integer :at_user_id
      t.timestamps
    end
  end
end
