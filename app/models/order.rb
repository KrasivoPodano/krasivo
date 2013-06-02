class Order < ActiveRecord::Base
  attr_accessible :name, :company, :phone1, :phone2, :phone3, :mail, :comment, :event_id, :event_type, :people,
                  :date, :time, :beautiful_cake, :ornament, :children_cake, :animators, :money
  belongs_to :event
end