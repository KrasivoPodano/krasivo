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
       f.input :text, input_html: { class: "redactor" }, :label => false
     end
     
     f.inputs t('tags') do
       f.input :tags, :as => :check_boxes
     end
     
     f.inputs 'SEO' do
       f.input :seo_url
       f.input :html_title
       f.input :meta_description,      :input_html => { :rows => 4 }
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
      row :seo_url
      row :html_title
      row :meta_description
    end 
    
    panel t('tags') do 
       table_for article.tags do 
         column :title do |column|
          column.title
         end
       end
     end
     
   end
   
end