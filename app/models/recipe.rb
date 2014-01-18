class Recipe < ActiveRecord::Base
  attr_accessible :text, :title, :recipe_type_id, :shorttext, :image,
                  :html_title, :seo_url, :meta_description
  
  extend FriendlyId
  friendly_id :seo_url, use: :slugged
  
  belongs_to :recipe_type
  validates :title, :image, :shorttext, :text, :presence => true
  validates :shorttext, :length => { :maximum => 125 }
  has_attached_file :image, :styles => { :medium => "300x200#", :mail_big => "680x453#" }
end
