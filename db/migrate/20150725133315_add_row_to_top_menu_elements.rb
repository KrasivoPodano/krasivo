class AddRowToTopMenuElements < ActiveRecord::Migration
  def change
    add_column :top_menu_elements, :row, :integer, default: 1, null: false
  end
end
