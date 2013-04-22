class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.integer :album_id
      t.attachment :image

      t.timestamps
    end
  end
end
