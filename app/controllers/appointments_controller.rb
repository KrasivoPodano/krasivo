class AppointmentsController < ApplicationController
  before_filter :new_appointment
  
  def create
    unless params[:appointment][:email].present?
      @firstname = params[:appointment][:firstname]
      @lastname = params[:appointment][:lastname]
      @phone = params[:appointment][:phone]
      @event = Event.find(params[:appointment][:event_id])  
      @appointment.save
      send_confirmation
    end
  end
  
  private

  def new_appointment
    @appointment = Appointment.new(params[:appointment])
  end
  
  def send_confirmation
    OrderMailer.appointment_email(@firstname, @lastname, @phone, @event).deliver
  end
  
  
end
