class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :title
      t.text :text
      t.string :link
      t.attachment :image
      t.integer :position, :null => false, :default => 0

      t.timestamps
    end
  end
end
