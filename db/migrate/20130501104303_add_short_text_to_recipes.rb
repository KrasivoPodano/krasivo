class AddShortTextToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :shorttext, :text
  end
end
