class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    @front_images = @event.front_images
    unless @event.album.nil?
    @photos = @event.album.photos
    end
    @events = Event.where("date >= ?", Time.now ).order("date asc")
  end
  
  def future
    @events = Event.where("date >= ?", Time.now ).order("date asc")
  end
  
  def past
    @events = Event.where("date <= ?", Time.now ).order("date asc")
  end 
  
end
