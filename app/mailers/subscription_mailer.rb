class SubscriptionMailer < ActionMailer::Base
  default :css => 'email', from: "info@krasivopodano.ru"
  
  def events_feed_email
    @events = Event.published.master_classes.where(:date => Time.now.next_week..Time.now.next_week.end_of_week).order('date ASC')
    @courses = Event.published.courses
    mail(to: ["m.nikolaev@me.com", "babrovka@gmail.com"], subject: t("events_for_the_next_week"))
  end
  
  def articles_feed_email(article)
    @article = article
    mail(to: Subscription.for_articles.pluck(:email), subject: t("new_article_created"))
  end
end