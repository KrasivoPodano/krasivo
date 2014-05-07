# coding: utf-8

class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    @front_images = @event.front_images
    unless @event.album.nil?
    @photos = @event.album.photos
    end
    @events = Event.published.future.order("date asc").limit(3)
  end
  
  def future
    @events = Event.master_classes.published.future.order("date asc")
  end
  
  def past
    @events = Event.master_classes.published.past.order("date desc")
  end 
  
  def courses
    @events = Event.courses.published.order("date asc")
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
  
  def feed
    # this will be the name of the feed displayed on the feed reader
    @title = "Красиво подано | МК"

    # the news items
    @events = Event.published.order("updated_at desc")

    # this will be our Feed's update timestamp
    @updated = @events.first.updated_at unless @events.empty?

    respond_to do |format|
      format.atom { render :layout => false }

      # we want the RSS feed to redirect permanently to the ATOM feed
      format.rss { redirect_to events_feed_path(:format => :atom), :status => :moved_permanently }
    end
  end
  
end
