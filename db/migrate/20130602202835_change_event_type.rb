class ChangeEventType < ActiveRecord::Migration
  def change
    remove_column :orders, :event_type_id, :integer
    add_column :orders, :event_type, :string
  end

end
