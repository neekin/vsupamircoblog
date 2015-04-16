class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :from_user_id
      t.integer :follow_user_id
      t.timestamps
    end
  end
end
