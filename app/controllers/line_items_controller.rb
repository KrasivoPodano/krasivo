class LineItemsController < InheritedResources::Base
  
  def create
    @cart = current_cart
    event = Event.find(params[:event_id])
    @line_item = @cart.line_items.build(event_id: event.id)
    
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to :back }
        format.js
      else
        format.html  { redirect_to events_path }
        format.js
      end
    end
  end
    
end
