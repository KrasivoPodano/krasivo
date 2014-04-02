class Order < ActiveRecord::Base
  apply_simple_captcha
  attr_accessor :email2
  attr_accessible :name, :company, :phone1, :phone2, :phone3, :mail, :comment, :event_id, :event_type, :people,
                  :date, :time, :beautiful_cake, :ornament, :children_cake, :animators, :money, :email2,
                  :captcha, :captcha_key
  belongs_to :event


  validates :name, :phone1, :presence => true

end