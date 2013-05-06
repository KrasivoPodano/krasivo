ActiveAdmin.register Album do
  config.batch_actions = false
  config.clear_sidebar_sections!

  index do 
    column :title
    column :text do |row|
      row.text
    end
    default_actions
  end

form :partial => "admin/album"
  
  show do |album|
    attributes_table do
      row :title
      row :text do |row|
        row.text
      end
    end
    
    panel t('images') do 
      table_for album.photos do 
        column :title
        column :image do |column|
          if column.image?
          image_tag column.image.url(:thumb)
        end
        end
      end
    end
      
   end

end
