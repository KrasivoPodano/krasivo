class Order < ActiveRecord::Base
  attr_accessible :name, :company, :phone1, :phone2, :phone3, :mail, :comment, :event_id, :event_type_id, :people,
                  :date, :time, :beautiful_cake, :ornament, :children_cake, :animators, :money
  belongs_to :event
  belongs_to :event_type
end