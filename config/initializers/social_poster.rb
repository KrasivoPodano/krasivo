SocialPoster.setup do |config|
  config.fb = {
    access_token: FACEBOOK_CONFIG['access_token']
  }

  config.twitter = {
    consumer_key:       TWITTER_CONFIG['consumer_key'],
    consumer_secret:    TWITTER_CONFIG['consumer_secret'],
    oauth_token:        TWITTER_CONFIG['oauth_token'],
    oauth_token_secret: TWITTER_CONFIG['oauth_token_secret']
  }

  config.lj = {
    user:     LIVEJOURNAL_CONFIG['user'],
    password: LIVEJOURNAL_CONFIG['password']
  }
end