ActiveAdmin.register Page do

  config.batch_actions = false
  config.clear_sidebar_sections!
  # actions :index, :show, :new, :create, :update, :edit
  
  
   index do 
     column :title
     column :seo_url
     column :text do |column|
       text = strip_tags(column.text).gsub(/&quot;/i,"").gsub(/&nbsp;/i,"")
       truncate(text, length: 100, omission: '...').html_safe
     end
     default_actions
   end

   form do |f|  
     f.inputs t('properties') do
       f.input :title
       f.input :text, input_html: { class: "redactor" }, :label => false
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
      row :text do |row|
        row.text.html_safe
      end
      row :seo_url
      row :html_title
      row :meta_description
    end  
   end  
end
