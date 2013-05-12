class Album < ActiveRecord::Base
  attr_accessible :text, :title, :photos_attributes, :album_photos_attributes
  has_many :photos
  accepts_nested_attributes_for :photos, :allow_destroy => true
  validates :title, :presence => true
end
