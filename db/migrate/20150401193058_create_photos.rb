class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :file
      t.integer :photobook_id
      t.string :filename
      t.string :original_filename
      t.timestamps
    end
  end
end
