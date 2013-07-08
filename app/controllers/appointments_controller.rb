class AppointmentsController < ApplicationController
  
  def new
    @appointment = Appointment.new  
  end
  
  def create
    
    @appointment = Appointment.create(params[:appointment])
    
    @event = Event.find(params[:appointment][:event_id])
    

    
    respond_to do |format|
      if @appointment.save
        flash[:notice] = t('order_success')
        format.js
        format.html { redirect_to :back }
      else
        format.html  { redirect_to events_path }
      end
    end
  end
  
end
