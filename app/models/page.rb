class Page < ActiveRecord::Base
  attr_accessible :section, :text, :title, :html_title, :seo_url
  
  extend FriendlyId
  friendly_id :seo_url, use: :slugged
end
