class RecipeType < ActiveRecord::Base
  attr_accessible :title
  has_many :recipes
  validates :title, :presence => true
end
