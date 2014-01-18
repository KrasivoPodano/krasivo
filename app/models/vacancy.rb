class Vacancy < ActiveRecord::Base
  attr_accessible :text, :title,
                  :html_title, :seo_url, :meta_description
  
  extend FriendlyId
  friendly_id :seo_url, use: :slugged
end
