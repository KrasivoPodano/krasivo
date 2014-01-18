ActiveAdmin.register Recipe do
   config.batch_actions = false
   config.clear_sidebar_sections!
   menu :parent => I18n.t('recipes')

   index do 
     column :title
     column :text do |column|
      truncate(strip_tags(column.text), length: 50).html_safe
     end
     default_actions
   end

     form :partial => "form"

  show do
    attributes_table do
      row :title
      row :image do |row|
        if row.image? then image_tag(row.image.url(:medium)) end
        end
      row :text do |row|
        row.text.html_safe
      end
      row :recipe_type_id
      row :seo_url
      row :html_title
      row :meta_description
    end  
   end
   
   controller do

      def create 
        @recipe = Recipe.new(params[:recipe])

        respond_to do |format|
           if @recipe.save
             format.html { redirect_to edit_admin_recipe_path(@recipe) }
           else
             format.html { render action: "new" }
           end
         end 
      end

      def update
        @recipe = Recipe.find(params[:id])

        respond_to do |format|
          if params[:preview_button] && @recipe.update_attributes(params[:recipe])
            format.html { redirect_to action: "edit" }
            flash[:notice] = t('recipe_updated')
         elsif @recipe.update_attributes(params[:recipe])
           format.html { redirect_to :action => :index }
          else
            format.html { render action: "edit" }
          end
        end
      end        
    end
   
end
