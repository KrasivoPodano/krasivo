class Appointment < ActiveRecord::Base
  apply_simple_captcha
  attr_accessor :email
  attr_accessible :event_id, :user_id, :people, :comment, :check, :phone, :firstname, :lastname, :email, :captcha, :captcha_key
  belongs_to :user
  belongs_to :event
  scope :checked, where(:check => true)
  
  validates :firstname, :phone, :presence => true
  
end
