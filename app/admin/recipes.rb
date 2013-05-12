ActiveAdmin.register Recipe do
   config.batch_actions = false
   config.clear_sidebar_sections!

   index do 
     column :title
     column :text do |column|
      truncate(strip_tags(column.text), length: 50).html_safe
     end
     default_actions
   end

     form :partial => "form"

  show do
    attributes_table do
      row :title
      row :image do |row|
        if row.image? then image_tag(row.image.url(:medium)) end
        end
      row :text do |row|
        row.text.html_safe
      end
      row :recipe_type_id
    end  
   end
end
