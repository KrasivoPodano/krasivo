# coding: utf-8
require 'populator'
require 'faker'

namespace :db do
  desc "Erase and fill database"
  task :articles => :environment do
    ArticleTag.destroy_all
    Article.destroy_all
    Article.populate 10..100 do |article|
      article.title = Populator.words(1..5).titleize
      article.text = Populator.sentences(2..30)
      article.date = Time.now
    end
  end

  task :events => :environment do
    Event.destroy_all
    FrontImage.destroy_all
    Event.populate 3 do |event|
      event.title = Populator.sentences(1)
      event.date = Date.today + rand(200)
      event.text = Populator.sentences(20..40)
      event.event_type_id = EventType.pluck(:id)
      event.main = %w[true false]
      event.shorttext = Populator.words(3)
      event.eventdetails = Populator.words(3)
      event.price = %w[500 1000 1500 2000]
      event.published = true
      event.property = 'master'
      event.filled = false
      event.duration = ['1 час', '2 часа', '3 часа']
    end
    puts "Future events created!"
    
    Event.populate 3 do |event|
      event.title = Populator.sentences(1)
      event.date = Date.today - rand(200)
      event.text = Populator.sentences(20..40)
      event.event_type_id = EventType.pluck(:id)
      event.main = %w[true false]
      event.shorttext = Populator.words(3)
      event.eventdetails = Populator.words(3)
      event.price = %w[500 1000 1500 2000]
      event.published = true
      event.property = 'master'
      event.filled = false
      event.duration = ['1 час', '2 часа', '3 часа']
    end
    puts "Past events created!"
    
    Event.populate 3 do |event|
      event.title = Populator.sentences(1)
      event.text = Populator.sentences(20..40)
      event.event_type_id = EventType.pluck(:id)
      event.main = %w[true false]
      event.shorttext = Populator.words(3)
      event.eventdetails = Populator.words(3)
      event.price = %w[500 1000 1500 2000]
      event.published = true
      event.property = 'course'
      event.filled = false
      event.duration = ['1 час', '2 часа', '3 часа']
    end
    puts "Courses created!"

    
    Event.all.each do |event|
      FrontImage.create(:event_id => event.id, :image => File.open(Dir.glob(File.join(Rails.root, 'covers', '*')).sample))
    end
    puts "Front images attached!"
    
  end
  
  task :copy_events_to_courses => :environment do
    Event.courses.each do |event|
      Course.create(
        :title => event.title,
        :text => event.text,
        :main => event.main,
        :shorttext => event.shorttext,
        :eventdetails => event.eventdetails,
        :price => event.price,
        :published => event.published,
        :property => event.property,
        :seo_url => event.seo_url,
        :html_title => event.html_title,
        :meta_description => event.meta_description,
        :slug => event.slug,
        :filled => event.filled,
        :want_more => event.want_more,
        :duration => event.duration
        )
    puts "Events copied!"
    end
  end
  
  
  
end

namespace :mail do
  task :distribute => :environment do
    SubscriptionMailer.events_feed_email.deliver
  end
end

namespace :pages do
  desc "Erase and fill database"
  task :populate => :environment do
    Page.create!(:section => 'about', :title => 'О школе', :text => 'О школе')
    Page.create!(:section => 'teach_list', :title => 'Что преподаем', :text => 'Что преподаем')
  end
end