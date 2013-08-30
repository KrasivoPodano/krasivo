class SubscriptionMailer < ActionMailer::Base
  default from: "info@krasivopodano.ru"
  
  def events_feed_email(event)
    @event = event
    mail(to: Subscription.for_events.pluck(:email), subject: t("new_event_created"))
  end
end