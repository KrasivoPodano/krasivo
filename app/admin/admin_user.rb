ActiveAdmin.register AdminUser do   
  menu :parent => I18n.t('users')
  
  index do                            
    column :email                     
    column :current_sign_in_at        
    column :last_sign_in_at           
    column :sign_in_count             
    default_actions                   
  end                                 

  filter :email                       

  form do |f|                         
    f.inputs "Admin Details" do       
      f.input :email                  
      f.input :password               
      f.input :password_confirmation  
    end                               
    f.actions                         
  end   
  
  show do
    attributes_table do
      row :email                     
      row :current_sign_in_at        
      row :last_sign_in_at           
      row :sign_in_count
    end  
   end                              
end                                   
