class TopMenuElement < ActiveRecord::Base
  attr_accessible :link, :position, :title, :row

  scope :first_row, where(:row => 1)
  scope :second_row, where(:row => 2)
end
