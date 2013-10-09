class SubscriptionMailer < ActionMailer::Base
  default from: "info@krasivopodano.ru"
  
  def events_feed_email
    @events = Event.where(:date => Time.now.next_week..Time.now.next_week.end_of_week)
    mail(to: "babrovka@gmail.com", subject: t("events_for_the_next_week"))
  end
  
  def articles_feed_email(article)
    @article = article
    mail(to: Subscription.for_articles.pluck(:email), subject: t("new_article_created"))
  end
end