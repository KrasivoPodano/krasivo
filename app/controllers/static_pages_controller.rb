class StaticPagesController < ApplicationController
  def home
    @main = Event.main.all
  end
  
  def contacts
  end
end
