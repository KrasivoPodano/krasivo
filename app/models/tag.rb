class Tag < ActiveRecord::Base
  attr_accessible :title
  has_many :articles
  
  has_many :article_tags
  has_many :articles, through: :article_tags
  
  def self.with_articles
    includes(:articles).where('articles.id in (?)',Article.all)
  end
  
end
