class CreateFrontImages < ActiveRecord::Migration
  def change
    create_table :front_images do |t|
      t.attachment :image
      t.integer :event_id
      t.timestamps
    end
  end
end
