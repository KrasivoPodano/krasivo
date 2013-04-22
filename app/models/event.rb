class Event < ActiveRecord::Base
  attr_accessible :title, :date, :text, :album_id, :event_type_id
  belongs_to :album
  belongs_to :event_type
  validates :title, :date, :text, :presence => true
  just_define_datetime_picker :date, :add_to_attr_accessible => true
end