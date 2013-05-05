class Photo < ActiveRecord::Base
  attr_accessible :title, :image, :album_id
  belongs_to :album
  has_attached_file :image, :styles => { :medium => "600x", :thumb => "230x150#" }
end