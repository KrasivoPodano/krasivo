ActiveAdmin.register Album do
  config.batch_actions = false
  config.clear_sidebar_sections!

  index do 
    column :title
    column :text do |row|
      row.text.html_safe
    end
    default_actions
  end

  form do |f|  
    f.inputs "Details" do
      f.input :title
      f.input :text, :input_html => { :rows => 4  }
    end
    
    f.has_many :photos do |attachment_form| 
      attachment_form.input :title  
      attachment_form.input :image, :as => :file, :hint => ( attachment_form.object.new_record? || !attachment_form.object.image ) ? nil : image_tag(attachment_form.object.image.url(:thumb))
      attachment_form.input :_destroy, :as => :boolean, :required => false, :label => I18n.t('destroy')
    end
    f.actions
  end
  
  show do |album|
    attributes_table do
      row :title
      row :text do |row|
        row.text.html_safe
      end
    end
    
    panel "Images" do 
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
