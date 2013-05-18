class Order < ActiveRecord::Base
  attr_accessible :name, :company, :phone1, :phone2, :phone3, :mail, :comment, :event_id
  belongs_to :event
end