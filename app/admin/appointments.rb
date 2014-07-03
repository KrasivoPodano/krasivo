ActiveAdmin.register Appointment do
  config.batch_actions = false
  config.clear_sidebar_sections!
  
  
  index do 
    column :id
    column :event_id do |column| 
      event = Event.find(column.event)
      link_to event.title, admin_event_path(column.event)
    end
    column :event_id do |column| 
      if Event.exists?(column.event)
        event = Event.find(column.event)
        event.date.strftime('%d.%m.%y') if event.date.present?
      end
    end
    
    column :firstname
    column :lastname
    column :phone
    column :created_at do |column|
      column.created_at.strftime('%d.%m.%y') if column.created_at.present?
    end
    
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
      row :event_id do |row| 
        if Event.exists?(row.event)
          event = Event.find(row.event)
          event.date.strftime('%d.%m.%y') if event.date.present?
        end
      end
      row :firstname
      row :lastname
      row :phone
      row :created_at do |row|
        row.created_at.strftime('%d.%m.%y') if row.created_at.present?
      end
    end  
   end
     
end
