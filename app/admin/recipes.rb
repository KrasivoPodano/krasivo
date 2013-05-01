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

   form do |f|  
     f.inputs "Details" do
       f.input :title
       f.input :image, :as => :file, :hint => ( f.object.new_record? || !f.object.image ) ? nil : image_tag(f.object.image.url(:medium))
       f.input :shorttext, :input_html => { :rows => 1  }
       f.input :text, :as => :ckeditor, :label => false
     end
     
     f.inputs t('recipe_type') do
       f.input :recipe_type_id, :as => :select, :collection => RecipeType.all
     end
     
     f.actions
   end

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
