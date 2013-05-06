ActiveAdmin.register Photo do
  belongs_to :album
  navigation_menu :album
  
  controller do
    def destroy
      photo = Photo.find(params[:id])
      photo.destroy
      redirect_to :back
    end
  end
  
end
