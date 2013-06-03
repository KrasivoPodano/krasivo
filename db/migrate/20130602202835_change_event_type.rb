class ChangeEventType < ActiveRecord::Migration
  def up
    remove_column :orders, :event_type_id
    add_column :orders, :event_type, :string
  end
  
  def down
    add_column :orders, :event_type_id, :integer
    remove_column :orders, :event_type
  end

end
