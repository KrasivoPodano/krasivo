class StaticPagesController < ApplicationController
  def home
    @main = Event.master_classes.published.main.future
    @future = Event.master_classes.published.where("date >= ?", Time.now ).order("date asc").limit(3)
    @past = Event.master_classes.published.where("date <= ?", Time.now ).order("date desc").limit(3)
    @courses = Event.courses.published.order("date desc").limit(3)
    @slides = Slide.all
  end
  
  def contacts
    @event = Event.published.where("date >= ?", Time.now ).order("date asc").first
    @events = Event.published.where("date >= ?", Time.now ).order("date asc").limit(3)
  end
  
  def shcool
  end
  
  def services
  end
  
  def vacancy
    @page = Page.find_by_section('vacancy')
  end
end
