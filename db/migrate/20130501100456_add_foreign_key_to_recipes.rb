class AddForeignKeyToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :recipe_type_id, :integer
  end
end
