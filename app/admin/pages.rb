ActiveAdmin.register Page do

  config.batch_actions = false
  config.clear_sidebar_sections!
  actions :index, :show, :new, :create, :update, :edit
  
  
   index do 
     column :section
     column :title
     column :text do |column|
       column.text.html_safe
     end
     default_actions
   end

   form do |f|  
     f.inputs t('properties') do
       f.input :title
       f.input :text, :as => :ckeditor, :label => false
     end
     f.actions
   end

  show do
    attributes_table do
      row :section
      row :title
      row :text do |row|
        row.text.html_safe
      end
    end  
   end  
end
