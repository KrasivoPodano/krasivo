ActiveAdmin.register Article do
  menu :parent => I18n.t('blog')
  config.batch_actions = false
  config.sort_order = 'created_at_desc'
  
  index do 
     column :title
     column :date
     column :text do |row|
       row.text.html_safe
     end
     column :created_at
     default_actions
   end

   form do |f|  
     f.inputs t('properties') do
       f.input :title
       f.input :date
       f.input :text, :as => :ckeditor, :label => false
     end
     
     f.inputs t('tags') do
       f.input :tags, :as => :check_boxes
     end
     
     f.actions
   end

  show do |article|
    attributes_table do
      row :title
      row :date
      row :text do |row|
        raw row.text.html_safe
      end
    end 
    
    panel t('tags') do 
       table_for article.tags do 
         column :title do |column|
          column.title
         end
       end
     end
  
   end
   
   
   controller do

      def create 
        @article = Article.new(params[:article])

        respond_to do |format|
           if @article.save
             format.html { redirect_to :action => :index }
             SocialPoster.write(:lj, @article.title, @article.text)
             flash[:notice] = t('article_created')
           else
             format.html { render action: "new" }
           end
         end 
      end

      def update
        @article = Article.find(params[:id])

        respond_to do |format|
          if @article.update_attributes(params[:article])
            format.html { redirect_to :action => :index }
            flash[:notice] = t('article_updated')
          else
            format.html { render action: "edit" }
          end
      end        
    end
    
  end
   
   
end
