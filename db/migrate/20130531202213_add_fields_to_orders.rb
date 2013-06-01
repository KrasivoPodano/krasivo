class AddFieldsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :event_type_id, :integer
    add_column :orders, :people, :integer
    add_column :orders, :date, :date
    add_column :orders, :time, :time
    add_column :orders, :beautiful_cake, :boolean
    add_column :orders, :ornament, :boolean
    add_column :orders, :children_cake, :boolean
    add_column :orders, :animators, :boolean  
    add_column :orders, :money, :decimal, precision: 8, scale: 0 
    
  end
end