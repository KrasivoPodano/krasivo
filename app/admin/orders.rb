ActiveAdmin.register Order do
  config.batch_actions = false
  config.clear_sidebar_sections!
  
  index do 
    column :id
    column :name
    column :phone1
    column :phone2
    column :phone3
    column :mail
    column :comment
    column :event_id
    column :people
    column :date
    column :time
    column :beautiful_cake
    column :ornament
    column :children_cake
    column :animators
    column :money
    column :event_type
    
    default_actions
  end

end
