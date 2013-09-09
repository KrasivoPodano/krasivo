ActiveAdmin.register User do
  menu :parent => I18n.t('users')
  config.batch_actions = false
  
  index do                            
    column :email                     
      
    default_actions                   
  end                                 

  filter :email                       

  form do |f|                         
    f.inputs "Admin Details" do     
      f.input :name  
      f.input :email                  
      f.input :password               
      f.input :password_confirmation  
    end                               
    f.actions                         
  end
  
  show do
    
    attributes_table do
      row :name
      row :email
    end
  end
  
end
