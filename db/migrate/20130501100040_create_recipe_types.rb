class CreateRecipeTypes < ActiveRecord::Migration
  def change
    create_table :recipe_types do |t|
      t.string :title

      t.timestamps
    end
  end
end
