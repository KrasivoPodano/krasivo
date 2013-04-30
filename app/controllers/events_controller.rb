class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    @photos = @event.album.photos
  end
end
