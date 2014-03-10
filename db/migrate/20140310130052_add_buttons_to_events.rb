class AddButtonsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :filled, :boolean, :default => false
    add_column :events, :want_more, :boolean, :default => false
  end
end
