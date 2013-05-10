ActiveAdmin.register Photo do
  belongs_to :album
  navigation_menu :album
  
  controller do
 
    
    
    
    
    def destroy
      @photo = Photo.find(params[:id])
      @photo.destroy
      
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
      
      
    end
  end
  
end
