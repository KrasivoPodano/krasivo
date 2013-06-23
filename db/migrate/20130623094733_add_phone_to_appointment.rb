class AddPhoneToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :phone, :string
  end
end
