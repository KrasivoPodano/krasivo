class Appointment < ActiveRecord::Base
  attr_accessible :event_id, :user_id, :people, :comment
  belongs_to :user
  belongs_to :event
end
