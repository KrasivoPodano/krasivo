class Course < ActiveRecord::Base
  attr_accessible :duration, :eventdetails, :filled, :html_title, :main, :meta_description, 
                  :price, :property, :published, :seo_url, :shorttext, :slug, :text, :title, :want_more, 
                  :front_image_ids, :front_images_attributes, :event_ids
                
  has_many :front_images
  has_many :events
  accepts_nested_attributes_for :front_images, :allow_destroy => true
  accepts_nested_attributes_for :events
  
                  
  def publish 
    self.published = true
    self.save
  end
end
