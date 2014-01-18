class CreateTopMenuElements < ActiveRecord::Migration
  def change
    create_table :top_menu_elements do |t|
      t.string :title
      t.string :link
      t.integer :position

      t.timestamps
    end
  end
end
