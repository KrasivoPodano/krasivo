class ArticlesController < ApplicationController
  def index
    

    
    @tags = Tag.with_articles
    
    
    
    if params[:tag_id]
      @articles = Article.includes(:tags).where(tags: { id: params[:tag_id] }).order("created_at DESC")
    else
      @articles = Article.order("created_at DESC")
    end
    
  end
  
  def show
    @article = Article.find(params[:id])
  end
end
