namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    ArticleTag.destroy_all
    
    Article.destroy_all
    
    Article.populate 10..100 do |article|
      article.title = Populator.words(1..5).titleize
      article.text = Populator.sentences(2..30)
      article.date = Time.now
    end

  end
end