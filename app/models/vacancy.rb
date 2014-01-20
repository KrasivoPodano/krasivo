class Vacancy < ActiveRecord::Base
  attr_accessible :text, :title, :published,
                  :html_title, :seo_url, :meta_description
  
  extend FriendlyId
  friendly_id :seo_url, use: :slugged
  scope :published, where(:published => true)
end
