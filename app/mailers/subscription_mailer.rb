class SubscriptionMailer < ActionMailer::Base
  default from: "info@krasivopodano.ru"
  
  def events_feed_email(event)
    @event = event
    mail(to: Subscription.for_events.pluck(:email), subject: t("new_event_created"))
  end
  
  def articles_feed_email(article)
    @article = article
    mail(to: Subscription.for_articles.pluck(:email), subject: t("new_article_created"))
  end
end