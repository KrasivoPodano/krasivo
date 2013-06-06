class ChangeEventOrderId < ActiveRecord::Migration
  def up
    remove_column :orders, :event_id
    add_column :orders, :event_id, :integer,   :default => 0, :null => false
  end

  def down
    remove_column :orders, :event_id
    add_column :orders, :event_id, :integer
  end
end
