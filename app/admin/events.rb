ActiveAdmin.register Event do
  config.batch_actions = false
  config.clear_sidebar_sections!
  menu :parent => I18n.t('events')
  
  index do 
    column :property do |column|
      t(column.property)
    end 
    column :title
    column :published
    column :date
    column :text do |column|
      text = strip_tags(column.text).gsub(/&quot;/i,"").gsub(/&nbsp;/i,"")
  		truncate(text, length: 260, omission: '...').html_safe
    end
    column :main
    default_actions
  end
  
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
    end
  end
  
  controller do
     
     def create 
       @event = Event.new(params[:event])
       
       respond_to do |format|
          if @event.save && params[:event][:published] == '1'
            SubscriptionMailer.events_feed_email(@event).deliver
            format.html { redirect_to edit_admin_event_path(@event) }
          elsif  @event.save
            format.html { redirect_to edit_admin_event_path(@event) }
          else
            format.html { render action: "new" }
          end
        end 
     end
        
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

end
