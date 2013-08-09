ActiveAdmin.register Vacancy do
  config.batch_actions = false
  config.clear_sidebar_sections!
  menu false
  index do 
     column :title
     column :text do |column|
       truncate(strip_tags(column.text), length: 200).html_safe
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
      row :title
      row :text do |row|
        truncate(strip_tags(row.text), length: 200).html_safe
      end
    end  
   end
end
