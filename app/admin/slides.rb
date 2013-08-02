ActiveAdmin.register Slide do
  config.batch_actions = false
  config.clear_sidebar_sections!
  
   index do 
     column :title
     column :text
    
     default_actions
   end

   form do |f|  
     f.inputs t('properties') do
       f.input :title
       f.input :position
       f.input :text
       f.input :link
       f.input :image, :as => :file
     end
     f.actions
   end

  show do |slide|
    attributes_table do
      row :title
      row :text
      row :link do |link|
        link_to slide.link, slide.link
      end
      row :image do |image|
        image_tag slide.image.url(:thumb)
      end
    end  
   end
end
