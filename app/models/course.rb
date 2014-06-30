class Course < ActiveRecord::Base
  attr_accessible :duration, :eventdetails, :filled, :html_title, :main, :meta_description, 
                  :price, :property, :published, :seo_url, :shorttext, :slug, :text, :title, :want_more
                  
                  
  def publish 
    self.published = true
    self.save
  end
end
