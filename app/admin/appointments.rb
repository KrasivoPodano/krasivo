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
end
