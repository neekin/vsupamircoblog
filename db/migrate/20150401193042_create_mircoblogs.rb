class CreateMircoblogs < ActiveRecord::Migration
  def change
    create_table :mircoblogs do |t|
      t.string :sharetext
      t.integer :user_id
      t.string :praise
      t.timestamps
    end
  end
end
