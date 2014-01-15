ActiveAdmin.register Page do

  config.batch_actions = false
  config.clear_sidebar_sections!
  # actions :index, :show, :new, :create, :update, :edit
  
  
   index do 
     column :title
     column :text do |column|
       column.text.html_safe
     end
     default_actions
   end

   form do |f|  
     f.inputs t('properties') do
       f.input :title
       f.input :seo_url
       f.input :html_title
       f.input :meta_description,      :input_html => { :rows => 4 }
       f.input :text, :as => :ckeditor, :label => false
     end
     f.actions
   end

  show do
    attributes_table do
      row :title
      row :seo_url
      row :html_title
      row :meta_description
      row :text do |row|
        row.text.html_safe
      end
      
    end  
   end  
end
