ActiveAdmin.register Appointment do
  config.batch_actions = false
  config.clear_sidebar_sections!
  
  
  index do 
    column :event_id do |column| 
      event = Event.find(column.event)
      link_to event.title, admin_event_path(column.event)
    end
    column :firstname
    column :lastname
    column :phone
    
    
    default_actions  
  end

   form do |f|  
     f.inputs t('properties') do
       f.input :event_id, :as => :select, :collection => Event.all, :label => false
       f.input :firstname
       f.input :lastname
       f.input :phone
     end
     f.actions
   end

  show do
    attributes_table do

      row :event_id
      row :firstname
      row :lastname
      row :phone
    end  
   end
     
end
