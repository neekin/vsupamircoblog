class CreatePointpraises < ActiveRecord::Migration
  def change
    create_table :pointpraises do |t|
      t.integer :from_user_id
      t.integer :to_user_id
      t.timestamps
    end
  end
end
