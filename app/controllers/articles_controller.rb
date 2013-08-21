# coding: utf-8

class ArticlesController < ApplicationController
  def index
    @tags = Tag.with_articles
    articles = Article.published.order("created_at DESC")
    
    if params[:tag_id]
      @articles = Article.published.find( :all, :include => :tags, :conditions => "tags.id = #{params[:tag_id]}", :order => "articles.created_at DESC")
    else
      @articles = articles
    end
    
    respond_to do |format|
        format.html
        format.js
    end
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def feed
    # this will be the name of the feed displayed on the feed reader
    @title = "Красиво подано | Блог"

    # the news items
    @articles = Article.published.order("updated_at desc")

    # this will be our Feed's update timestamp
    @updated = @articles.first.updated_at unless @articles.empty?

    respond_to do |format|
      format.atom { render :layout => false }

      # we want the RSS feed to redirect permanently to the ATOM feed
      format.rss { redirect_to blog_feed_path(:format => :atom), :status => :moved_permanently }
    end
  end
  
end
