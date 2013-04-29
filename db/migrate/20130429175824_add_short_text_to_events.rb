class AddShortTextToEvents < ActiveRecord::Migration
  def change
    add_column :events, :shorttext, :text
    add_column :events, :eventdetails, :text
  end
end
