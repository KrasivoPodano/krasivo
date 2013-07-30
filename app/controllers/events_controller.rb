class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    @front_images = @event.front_images
    unless @event.album.nil?
    @photos = @event.album.photos
    end
    @events = Event.where("date >= ?", Time.now ).order("date asc").limit(3)
  end
  
  def future
    @events = Event.published.where("date >= ?", Time.now ).order("date asc")
  end
  
  def past
    @events = Event.published.where("date <= ?", Time.now ).order("date desc")
  end 
  
  def destroy
    @event = Event.find(params[:id])
    @cart = current_cart    
    @line_item = @cart.line_items.find_by_event_id(@event)
    @line_item.destroy
    
    respond_to do |format|
      format.html { redirect_to :back }
    end
  end
  
end
