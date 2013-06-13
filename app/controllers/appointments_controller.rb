class AppointmentsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def new
    @appointment = Appointment.new
  end
  
  def create
    
    @appointment = Appointment.create(params[:appointment])
    @appointment.user_id = current_user.id
    event = Event.find(params[:appointment][:event_id])
    
    respond_to do |format|
      if @appointment.save
        flash[:notice] = t('order_success')
        OrderMailer.appointment_confirm_email(current_user, event, @appointment).deliver
        format.js
        format.html { redirect_to :back }
      else
        format.html  { redirect_to events_path }
      end
    end
  end
  
end
