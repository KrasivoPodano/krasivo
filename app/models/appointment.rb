class Appointment < ActiveRecord::Base
  attr_accessor :email
  attr_accessible :event_id, :user_id, :people, :comment, :check, :phone, :firstname, :lastname, :email
  belongs_to :user
  belongs_to :event
  scope :checked, where(:check => true)
  
  
  
end
