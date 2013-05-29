ActiveAdmin.register Appointment do
   index do 
     column :title
     default_actions
   end

   form do |f|  
     f.inputs t('properties') do
       f.input :title
     end
     f.actions
   end

  show do
    attributes_table do
      row :user_id do |row|
        link_to row.user.email, admin_user_path(row.user)
      end
      row :event_id
    end  
   end
end
