class StaticPagesController < ApplicationController
  def home
    @main = Event.main.all
    @future = Event.where("date >= ?", Time.now ).order("date desc").limit(3)
    @past = Event.where("date <= ?", Time.now ).order("date asc").limit(3)
  end
  
  def contacts
  end
end
