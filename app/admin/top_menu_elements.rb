ActiveAdmin.register TopMenuElement do
  config.batch_actions = false
  config.clear_sidebar_sections!
  menu :parent => I18n.t('menu'), :label => I18n.t('top_menu')
  
   index do
     column :position 
     column :title
     column :link
     
     default_actions
   end

   form do |f|  
     f.inputs t('properties') do
       f.input :position
       f.input :title
       f.input :link
     end
     f.actions
   end

  show do
    attributes_table do
      row :position
      row :title
      row :link
    end  
   end  
end
