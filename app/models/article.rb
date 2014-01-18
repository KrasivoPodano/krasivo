class Article < ActiveRecord::Base
  attr_accessible :date, :text, :title, :tag_ids, :published,
                  :html_title, :seo_url, :meta_description
  
  extend FriendlyId
  friendly_id :seo_url, use: :slugged
  
  has_many :article_tags
  has_many :tags, through: :article_tags
  
  scope :published, -> { where(published: true) }
  
  validates :title, :text, :presence => true
  validates :title, :date, :presence => true
end
