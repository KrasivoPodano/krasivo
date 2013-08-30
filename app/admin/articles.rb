ActiveAdmin.register Article do
  menu :parent => I18n.t('blog')
  config.batch_actions = false
  config.sort_order = 'created_at_desc'  
  
  member_action :crosspost, :method => :post do    
    article = Article.find(params[:id])
    text = strip_tags(article.text).gsub(/&quot;/i,"").gsub(/&nbsp;/i,"").html_safe
    SocialPoster.write(:twitter, article.title)
    SocialPoster.write(:fb, article.title)
    SocialPoster.write(:lj, article.text, article.title)
    SocialPoster.write(:vk, text, nil, owner_id: '-57364601')
    redirect_to :action => :show
    flash[:notice] = t('article_crossposted')
  end
  
  member_action :crosspost_vk, :method => :post do
    article = Article.find(params[:id])
    text = ActionController::Base.helpers.strip_tags(article.text).gsub(/&quot;/i,"").gsub(/&nbsp;/i,"").html_safe
    SocialPoster.write(:vk, text, nil, owner_id: '-57364601')
    redirect_to :action => :show
    flash[:notice] = t('article_crossposted')
  end

  action_item :only => :show do
    link_to(I18n.t('crosspost'), crosspost_admin_article_path, :method => :post)
  end
  
  action_item :only => :show do
    link_to(I18n.t('crosspost_vk'), crosspost_vk_admin_article_path, :method => :post)
  end
  
  index do 
     column :title
     column :published
     column :date
     column :text do |row|
       truncate(strip_tags(row.text), length: 200).html_safe
     end
     column :created_at
     default_actions
   end

   form do |f|  
     f.inputs t('properties') do
       f.input :title
       f.input :published
       f.input :date, :as => :date_picker
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
      row :published
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
           if @article.save && params[:article][:published] == '1'
             SubscriptionMailer.articles_feed_email(@article).deliver
             format.html { redirect_to admin_article_path(@article) }
           elsif @article.save
             format.html { redirect_to admin_article_path(@article) }
           else
             format.html { render action: "new" }
           end
         end 
      end
      

    
    end
   
   
   
   
   
   
end
