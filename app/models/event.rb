class Event < ActiveRecord::Base
  attr_accessible :title, :date, :text, :album_id, :event_type_id, :main, :shorttext, :eventdetails, :front_images_attributes
  scope :main, where(:main => true)
  belongs_to :album
  belongs_to :event_type
  has_many :front_images
  accepts_nested_attributes_for :front_images, :allow_destroy => true
  validates :title, :date, :text, :presence => true
  validates :shorttext, :length => { :maximum => 125 }
  validates :eventdetails, :length => { :maximum => 70 }
  just_define_datetime_picker :date, :add_to_attr_accessible => true
end