ActiveAdmin.register Appointment do
  config.batch_actions = false
  config.clear_sidebar_sections!
  
  index do 
    column :user_id do |column|
      link_to column.user.email, admin_user_path(column.user)
    end
    column :event_id do |column| 
      event = Event.find(column.event)
      link_to event.title, admin_event_path(column.event)
    end
    column :people
    column :comment
    column :check
    
    default_actions  
  end

   form do |f|  
     f.inputs t('properties') do
       f.input :people
       f.input :comment
       f.input :check
     end
     f.actions
   end

  show do
    attributes_table do
      row :user_id do |row|
        link_to row.user.email, admin_user_path(row.user)
      end
      row :event_id
      row :people
      row :comment
    end  
   end
   
   controller do

     def update
       @appointment = Appointment.find(params[:id])
       @user = User.find(@appointment.user_id)
       @event = Event.find(@appointment.event_id)
       
          if params[:appointment][:check] == "1" && @appointment.update_attributes(params[:appointment])
            redirect_to :action => :index
            OrderMailer.appointment_confirm_email(@user, @event, @appointment).deliver
            flash[:notice] = t('appointment_approved_mail_sent')
          elsif @appointment.update_attributes(params[:appointment])
            redirect_to :action => :index
          else
            render action: "edit"
          end
     end

   end
   
   
end
