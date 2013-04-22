class Album < ActiveRecord::Base
  attr_accessible :text, :title, :photos_attributes
  has_many :photos
  accepts_nested_attributes_for :photos, :allow_destroy => true
  validates :title, :text, :presence => true
end
