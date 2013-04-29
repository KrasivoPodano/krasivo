class AddFieldsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :main, :boolean
    add_attachment :events, :image
  end
end
