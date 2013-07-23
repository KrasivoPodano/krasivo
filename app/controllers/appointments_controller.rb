class AppointmentsController < ApplicationController
  before_filter :new_appointment
  
  def create
    if verify_recaptcha(:model => @appointment, :message => t('please_enter_correct_data')) && @appointment.save
      
      @firstname = params[:appointment][:firstname]
      @lastname = params[:appointment][:lastname]
      @phone = params[:appointment][:phone]
      @event = Event.find(params[:appointment][:event_id])
      
      result = {status: 'ok'}
    else
      result = {errors: @appointment.errors.full_messages}
    end
    render json: result
  end
  
  private

  def new_appointment
    @appointment = Appointment.new(params[:appointment])
  end
  
  def send_confirmation
    OrderMailer.appointment_email(@firstname, @lastname, @phone, @event).deliver
  end
  
  
end
