class ArticlesController < ApplicationController
  def index
    

    
    @tags = Tag.with_articles
    
    articles = Article.order("created_at DESC")
    
    if params[:tag_id]
      @articles = Article.find( :all, :include => :tags, :conditions => "tags.id = #{params[:tag_id]}", :order => "articles.created_at DESC")
    else
      @articles = Article.all
    end
    
    respond_to do |format|
        format.html
        format.js
    end
    
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
end
