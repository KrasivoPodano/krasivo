class Article < ActiveRecord::Base
  attr_accessible :date, :tag_id, :text, :title
  belongs_to :tag
end
