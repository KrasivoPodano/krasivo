class AddCheckToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :check, :boolean
  end
end
