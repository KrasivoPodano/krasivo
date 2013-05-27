class AppointmentsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def create
    event = Event.find(params[:event_id])
    user = User.find(current_user.id)
    
    @order = Appointment.create(:user_id => user.id, :event_id => event.id)
    
    respond_to do |format|
      if @order.save
        format.html { redirect_to :back }
      else
        format.html  { redirect_to events_path }
      end
    end
  end
  
end
