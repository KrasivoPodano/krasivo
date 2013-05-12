ActiveAdmin.register FrontImage do
  belongs_to :event
  navigation_menu :event
  
  controller do

    def destroy
      @front_image = FrontImage.find(params[:id])
      @front_image.destroy
      
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end
    
  end
  
end
