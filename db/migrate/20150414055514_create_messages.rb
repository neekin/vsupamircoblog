class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :from_user_id
      t.integer :to_user_id
      t.string :message
      t.integer :msgtype
      t.integer :msgstatu
      t.timestamps
    end
  end
end
