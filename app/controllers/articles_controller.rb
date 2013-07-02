class ArticlesController < ApplicationController
  def index
    @tags = Tag.all
    @articles = Article.all
  end
  
  def show
    @article = Article.find(params[:id])
  end
end
