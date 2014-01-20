ActiveAdmin.register Vacancy do
  config.batch_actions = false
  config.clear_sidebar_sections!
  index do 
     column :title
     column :published
     column :text do |column|
       truncate(strip_tags(column.text), length: 200).html_safe
     end
     default_actions
   end

   form do |f|  
     f.inputs t('properties') do
       f.input :title
       f.input :published
       f.input :text, :as => :ckeditor, :label => false
     end
     f.inputs 'SEO' do
       f.input :seo_url
       f.input :html_title
       f.input :meta_description,      :input_html => { :rows => 4 }
     end
     
     f.actions
   end

  show do
    attributes_table do
      row :title
      row :published
      row :text do |row|
        truncate(strip_tags(row.text), length: 200).html_safe
      end
      row :seo_url
      row :html_title
      row :meta_description
    end  
   end
end
