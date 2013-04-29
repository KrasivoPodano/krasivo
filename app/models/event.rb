class Event < ActiveRecord::Base
  attr_accessible :title, :date, :text, :album_id, :event_type_id, :main, :image, :shorttext, :eventdetails
  scope :main, where(:main => true)
  belongs_to :album
  belongs_to :event_type
  validates :title, :date, :text, :presence => true
  validates :shorttext, :length => { :maximum => 125 }
  validates :eventdetails, :length => { :maximum => 70 }
  just_define_datetime_picker :date, :add_to_attr_accessible => true
  has_attached_file :image, :styles => { :medium => "1400x749#", :thumb => "230x150#" }
end