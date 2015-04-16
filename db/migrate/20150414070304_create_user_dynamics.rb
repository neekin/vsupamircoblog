class CreateUserDynamics < ActiveRecord::Migration
  def change
    create_table :user_dynamics do |t|
      t.integer :dynamicstype
      t.timestamps
    end
  end
end