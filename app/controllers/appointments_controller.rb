class AppointmentsController < ApplicationController
  before_filter :new_appointment
  
  
  def create
    @firstname = params[:appointment][:firstname]
    @lastname = params[:appointment][:lastname]
    @phone = params[:appointment][:phone]
    @event = Event.find(params[:appointment][:event_id])
    if @appointment.save_with_captcha
      result = {status: 'ok'}
      send_confirmation
    else
      result = {errors: @appointment.errors}
    end
    render json: result
  end

  def refresh_captcha_div
    render :partial => 'appointments/captcha_wrapper'
  end
  
  private

  def new_appointment
    @appointment = Appointment.new(params[:appointment])
  end
  
  def send_confirmation
    OrderMailer.appointment_email(@firstname, @lastname, @phone, @event, @appointment).deliver
  end
  
  
end
