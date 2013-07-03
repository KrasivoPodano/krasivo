class ArticlesController < ApplicationController
  def index
    

    
    @tags = Tag.with_articles
    
    
    
    if params[:tag_id]
      @articles = Article.includes(:tags).where(tags: { id: params[:tag_id] })
    else
      @articles = Article.all
    end
    
  end
  
  def show
    @article = Article.find(params[:id])
  end
end
