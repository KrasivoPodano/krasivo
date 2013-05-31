class AppointmentsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def new
    @appointment = Appointment.new
  end
  
  def create
    
    @appointment = Appointment.create(params[:appointment])
    @appointment.user_id = current_user.id
    
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
