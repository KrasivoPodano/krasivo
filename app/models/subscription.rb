#encoding: utf-8

class Subscription < ActiveRecord::Base
  attr_accessible :articles, :email, :events
  
  validates :email, :presence => {:message => 'Укажите email'}
  validates :email, :length => {:minimum => 3, :maximum => 254},
                    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  validates :email, :uniqueness => true 
  
  scope :for_events, -> { where(events: true) }  
  scope :for_articles, -> { where(articles: true) } 
end
