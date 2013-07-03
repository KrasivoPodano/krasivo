class ArticleTag < ActiveRecord::Base
  attr_accessible :article_id, :tag_id
  
  belongs_to :article
  belongs_to :tag
end
