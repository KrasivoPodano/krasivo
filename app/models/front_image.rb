class FrontImage < ActiveRecord::Base
  attr_accessible :image, :event_id
  belongs_to :event, :dependent => :destroy
  has_attached_file :image, :styles => { :medium => "1400x749#", :thumb => "300x200#", :admin => "230x150#", 
                                         :email_small => "200x133#", :email_big => "600x400#" }
  validates :image, :presence => true
end
