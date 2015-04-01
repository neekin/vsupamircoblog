class CreatePhotobooks < ActiveRecord::Migration
  def change
    create_table :photobooks do |t|
      t.string :bookname
      t.string :bookcover
      t.timestamps
    end
  end
end
