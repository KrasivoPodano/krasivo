class AddNameToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :firstname, :string
    add_column :appointments, :lastname, :string
  end
end
