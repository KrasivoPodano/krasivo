ActiveAdmin.register FrontImage do
  
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
