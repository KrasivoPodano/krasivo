class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    @photos = @event.front_images
  end
  
  def future
    @events = Event.where("date >= ?", Time.now ).order("date asc")
  end
  
  def past
    @events = Event.where("date <= ?", Time.now ).order("date asc")
  end 
  
end
