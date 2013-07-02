class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.datetime :date
      t.text :text
      t.integer :tag_id

      t.timestamps
    end
  end
end
