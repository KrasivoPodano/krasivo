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
    f.inputs "Details" do
      f.input :title
      f.input :date, :as => :datepicker
      f.input :text
    end
    
    f.inputs "Album" do
      f.input :album_id, :as => :select, :collection => Album.all
    end
    f.inputs "Type" do
      f.input :event_type_id, :as => :select, :collection => EventType.all
    end
    

    f.actions
  end
  
  show do
    
    attributes_table do
      row :title
      row :date
      row :text do |row|
        row.text.html_safe
      end
      row :album_id
      row :event_type_id
    end
  end

end
