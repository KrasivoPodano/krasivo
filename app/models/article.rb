class Article < ActiveRecord::Base
  attr_accessible :date, :text, :title, :tag_ids
  
  
  has_many :article_tags
  has_many :tags, through: :article_tags
  
  validates :title, :text, :presence => true
end
