class Recipe < ActiveRecord::Base
  attr_accessible :text, :title, :recipe_type_id, :shorttext, :image
  belongs_to :recipe_type
  validates :title, :text, :recipe_type_id, :presence => true
  validates :shorttext, :length => { :maximum => 125 }
  has_attached_file :image, :styles => { :medium => "300x200#" }
end
