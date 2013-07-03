class RemoveForeignKeyFromArticles < ActiveRecord::Migration
  def up
    remove_column :articles, :tag_id
  end

  def down
    add_column :articles, :tag_id, :integer
  end
end
