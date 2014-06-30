# coding: utf-8

ActiveAdmin.register Course do
  config.batch_actions = false
  filter :published, as: :select, collection: [['Да', 'true'], ['Нет', 'false']]
  
  index do 
    column :title do |column|
      column.title
    end
    bool_column :published
    column :text do |column|
      if column.text
        text = strip_tags(column.text).gsub(/&quot;/i,"").gsub(/&nbsp;/i,"")
        truncate(text, length: 100, omission: '...').html_safe
      end
    end
    
    column "" do |course|
      links = ''.html_safe
      links += link_to I18n.t('active_admin.view'), admin_course_path(course),
        :class => "member_link edit_link"
      links += link_to I18n.t('active_admin.edit'), edit_admin_course_path(course),
        :class => "member_link edit_link"
      if course.published
        links += link_to I18n.t('active_admin.unpublish'), unpublish_admin_course_path(course),
          :class => "member_link edit_link"
      else
        links += link_to I18n.t('active_admin.publish'), publish_admin_course_path(course),
          :class => "member_link edit_link"
      end
      links += link_to I18n.t('active_admin.delete'), admin_course_path(course),
        :method => :delete,
        :confirm => I18n.t('active_admin.delete_confirmation')
      links
    end
    
  end
  
  form :partial => "form"
  
  
  show do
    
    attributes_table do
      row :title
      row :published
      row :main
      row :text do |row|
        raw row.text.html_safe if row.text
      end
      row :seo_url
      row :html_title
      row :meta_description
    end
  end
      
   
   # custom_actions 
   
   member_action :publish, :method => :get do
     course = Course.find(params[:id])
     course.publish
     redirect_to :back, :notice => t('event_published')
   end
   
   member_action :unpublish, :method => :get do
     course = Course.find(params[:id])
     course.published = false
     course.save
     redirect_to :back, :notice => t('event_unpublished')
   end



end
