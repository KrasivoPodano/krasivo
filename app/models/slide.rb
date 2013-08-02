class Slide < ActiveRecord::Base
  attr_accessible :image, :link, :text, :title, :position
  default_scope order('position ASC')
  has_attached_file :image, :styles => { :medium => "1400x749#", :thumb => "300x200#", :admin => "230x150#" }
end
