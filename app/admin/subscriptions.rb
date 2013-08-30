ActiveAdmin.register Subscription do
  config.batch_actions = false
  config.clear_sidebar_sections!
  
   index do 
     column :email
     column :events
     column :articles
     default_actions
   end

   form do |f|  
     f.inputs t('properties') do
       f.input :email
       f.input :events
       f.input :articles
     end
     f.actions
   end

  show do
    attributes_table do
      row :email
      row :events
      row :articles
    end  
   end 
end
