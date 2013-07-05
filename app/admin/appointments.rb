ActiveAdmin.register Appointment do
  config.batch_actions = false
  config.clear_sidebar_sections!
  
  member_action :check, :method => :post do
    appointment = Appointment.find(params[:id])
    user = User.find(appointment.user_id)
    event = Event.find(appointment.event_id)
    OrderMailer.appointment_confirm_email(user, event, appointment).deliver
    appointment.update_attributes(:check => true)
    redirect_to :action => :show
    flash[:notice] = t('appointment_approved_mail_sent')
  end
  
  action_item :only => :show do
    link_to(I18n.t('check'), check_admin_appointment_path(appointment), :method => :post) unless appointment.check?
  end
  
  index do 
    column :user_id do |column|
      if column.user_id
      user = User.find(column.user_id)
      link_to user.email, admin_event_path(user)
      end
    end
    column :event_id do |column| 
      event = Event.find(column.event)
      link_to event.title, admin_event_path(column.event)
    end
    column :firstname
    column :lastname
    column :people
    column :phone
    column :check
    
    
    default_actions  
  end

   form do |f|  
     f.inputs t('properties') do
       f.input :people
       f.input :comment
     end
     f.actions
   end

  show do
    attributes_table do
      row :user_id do |row|
        link_to row.user.email, admin_user_path(row.user)
      end
      row :event_id
      row :firstname
      row :lastname
      row :event_id
      row :people
      row :comment
      row :phone
      row :check
    end  
   end
     
end
