ActiveAdmin.register Event do
  config.batch_actions = false
  config.clear_sidebar_sections!
  
  index do 
    column :title
    column :date
    column :text do |row|
      row.text.html_safe
    end
    default_actions
  end
  
  form do |f|  
    f.inputs t('properties') do
      f.input :title
      f.input :date, :as => :datepicker
      f.input :text
      f.input :main
      f.input :image, :as => :file, :hint => ( f.object.new_record? || !f.object.image ) ? nil : image_tag(f.object.image.url(:thumb))
    end
    
    f.inputs t('album') do
      f.input :album_id, :as => :select, :collection => Album.all
    end
    f.inputs t('event_type') do
      f.input :event_type_id, :as => :select, :collection => EventType.all
    end
    

    f.actions
  end
  
  show do
    
    attributes_table do
      row :title
      row :date
      row :main
      row :image do |row|
        if row.image? then image_tag(row.image.url(:thumb)) end
        end
      row :text do |row|
        row.text.html_safe
      end
      row :album_id
      row :event_type_id
    end
  end

end
