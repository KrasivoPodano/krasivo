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
      f.input :price
      f.input :date, :as => :datepicker
      f.input :shorttext, :input_html => { :rows => 1  }
      f.input :eventdetails, :input_html => { :rows => 1  }
      f.input :text, :as => :ckeditor, :label => false
      f.input :main
    end
    
    f.inputs t('album') do
      f.input :album_id, :as => :select, :collection => Album.all
    end
    f.inputs t('event_type') do
      f.input :event_type_id, :as => :select, :collection => EventType.all
    end
    
    f.has_many :front_images do |attachment_form| 
      attachment_form.input :image, :as => :file, :hint => ( attachment_form.object.new_record? || !attachment_form.object.image ) ? nil : image_tag(attachment_form.object.image.url(:thumb))
      attachment_form.input :_destroy, :as => :boolean, :required => false, :label => t('destroy')
    end
    
    f.actions
  end
  
  show do
    
    attributes_table do
      row :title
      row :date
      row :main
      row :text do |row|
        raw row.text.html_safe
      end
      row :album_id
      row :event_type_id
    end
  end

end
