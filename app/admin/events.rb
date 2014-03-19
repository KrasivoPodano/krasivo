# coding: utf-8

ActiveAdmin.register Event do
  
  
  config.batch_actions = false
  filter :published, as: :select, collection: [['Да', 'true'], ['Нет', 'false']]
  filter :property, as: :select, :collection => Event::PROPERTIES.map{|v| [I18n.t(v),v]}
  menu :parent => I18n.t('events')
  
  index do 
    column :property do |column|
      t(column.property)
    end 
    column :title
    bool_column :published
    column :date
    column :text do |column|
      text = strip_tags(column.text).gsub(/&quot;/i,"").gsub(/&nbsp;/i,"")
      truncate(text, length: 100, omission: '...').html_safe
    end
    column "" do |event|
      links = ''.html_safe
      links += link_to I18n.t('active_admin.view'), admin_event_path(event),
        :class => "member_link edit_link"
      links += link_to I18n.t('active_admin.edit'), edit_admin_event_path(event),
        :class => "member_link edit_link"
      links += link_to I18n.t('active_admin.publish'), publish_admin_event_path(event),
        :class => "member_link edit_link"
      links += link_to I18n.t('active_admin.delete'), admin_event_path(event),
        :method => :delete,
        :confirm => I18n.t('active_admin.delete_confirmation')
      links
    end
    
  end
  
  # index :as => :grid, :columns => 7 do |event|
  #   span do
  #     I18n.t(event.property)
  #   end
  #   div do
  #     event.date.strftime('%d.%m.%y') if event.date
  #   end
  #   div do
  #     truncate(event.title, length: 40)
  #   end
  #   div do
  #     link_to "Опубликовать", publish_admin_event_path(event), :method => :get
  #   end
  #   div do
  #     link_to "Редактировать", edit_admin_event_path(event)
  #   end
  # end
  
  form :partial => "form"
  
  show do
    
    attributes_table do
      row :title
      row :published
      row :date
      row :main
      row :text do |row|
        raw row.text.html_safe
      end
      row :album_id
      row :event_type_id
      row :seo_url
      row :html_title
      row :meta_description
    end
  end
  
  controller do        
     def update
       @event = Event.find(params[:id])     
       respond_to do |format|
         if params[:preview_button] && @event.update_attributes(params[:event])
           format.html { redirect_to action: "edit" }
           flash[:notice] = t('event_updated')
        elsif @event.update_attributes(params[:event])
          format.html { redirect_to :action => :index }
         else
           format.html { render action: "edit" }
         end
       end
     end        
   end
   
   # custom_actions 
   
   member_action :publish, :method => :get do
     event = Event.find(params[:id])
     event.publish
     redirect_to :back, :notice => t('event_published')
   end
   

end
