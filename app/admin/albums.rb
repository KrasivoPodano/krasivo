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

   
   controller do
     def create 
       
       @album = Album.new(params[:album])
       
       respond_to do |format|
          if @album.save
            format.html { redirect_to edit_admin_album_path(@album) }
          else
            format.html { render action: "new" }
          end
        end
       
     end
        

     def update
       @album = Album.find(params[:id])
       
       respond_to do |format|
         if params[:preview_button] && @album.update_attributes(params[:album])
           format.html { redirect_to action: "edit" }
        elsif @album.update_attributes(params[:album])
          format.html { redirect_to :action => :show }
         else
           format.html { render action: "edit" }
         end
       end
     end        
   end

end
