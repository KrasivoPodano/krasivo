class AppointmentsController < ApplicationController
  
  def new
    @appointment = Appointment.new  
  end
  
  def create
    @appointment = Appointment.create(params[:appointment])
    @firstname = params[:appointment][:firstname]
    @lastname = params[:appointment][:lastname]
    @phone = params[:appointment][:phone]
    @event = Event.find(params[:appointment][:event_id])
    
    OrderMailer.appointment_email(@firstname, @lastname, @phone, @event).deliver

    
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
