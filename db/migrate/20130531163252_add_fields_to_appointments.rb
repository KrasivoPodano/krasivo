class AddFieldsToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :people, :integer
    add_column :appointments, :comment, :text
  end
end
