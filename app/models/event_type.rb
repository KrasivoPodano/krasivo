class EventType < ActiveRecord::Base
  attr_accessible :title
  has_many :events
  has_many :orders
  accepts_nested_attributes_for :events, :allow_destroy => true
  validates :title, :presence => true
end
