class Tag < ActiveRecord::Base
  attr_accessible :title
  has_many :articles
end
