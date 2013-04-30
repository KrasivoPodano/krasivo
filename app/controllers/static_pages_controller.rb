class StaticPagesController < ApplicationController
  def home
    @main = Event.main.all
    @closest = Event.where("date >= ?", Time.now ).limit(3).order("date desc")
    @events = Event.limit(3)
  end
  
  def contacts
  end
end
