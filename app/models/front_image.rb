class FrontImage < ActiveRecord::Base
  attr_accessible :image, :event_id
  belongs_to :event
  has_attached_file :image, :styles => { :medium => "1400x749#", :thumb => "230x150#" }
  validates :image, :presence => true
end
