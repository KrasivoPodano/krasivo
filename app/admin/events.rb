# coding: utf-8

ActiveAdmin.register Event do
  
  
  config.batch_actions = false
  filter :published, as: :select, collection: [['Да', 'true'], ['Нет', 'false']]
  filter :property, as: :select, :collection => Event::PROPERTIES.map{|v| [I18n.t(v),v]}
  menu :parent => I18n.t('events')
  
  
  scope 'Все', :all, :default => true
  scope 'Предстоящие' do |events|
    events.future
  end
  scope 'Прошедшие' do |events|
    events.past 
  end
  scope 'Курсы' do |events|
    events.courses 
  end
  scope 'Мастер классы' do |events|
    events.master_classes 
  end
  
  
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
    column :duration
    column "" do |event|
      links = ''.html_safe
      links += link_to I18n.t('active_admin.view'), admin_event_path(event),
        :class => "member_link edit_link"
      links += link_to I18n.t('active_admin.edit'), edit_admin_event_path(event),
        :class => "member_link edit_link"
      if event.published
        links += link_to I18n.t('active_admin.unpublish'), unpublish_admin_event_path(event),
          :class => "member_link edit_link"
      else
        links += link_to I18n.t('active_admin.publish'), publish_admin_event_path(event),
          :class => "member_link edit_link"
      end
      links += link_to I18n.t('active_admin.copy'), copy_admin_event_path(event),
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
   
   member_action :unpublish, :method => :get do
     event = Event.find(params[:id])
     event.published = false
     event.save
     redirect_to :back, :notice => t('event_unpublished')
   end
   
   member_action :copy, :method => :get do
     event = Event.find(params[:id])
     @event = Event.new
     @event.assign_attributes(
         title: event.title,
         property: event.property, 
         price: event.price,
         date: event.date,
         shorttext: event.shorttext,
         eventdetails: event.eventdetails,
         text: event.text,
         event_type_id: event.event_type_id,
         seo_url: event.seo_url,
         html_title: event.html_title,
         meta_description: event.meta_description,
         front_images: event.front_images
     )
     
     render :action => :new, :layout => false
   end
   

end
