SocialPoster.setup do |config|
  config.fb = {
    access_token: SOCIAL_CONFIG['access_token']
  }

  config.twitter = {
    consumer_key:       SOCIAL_CONFIG['consumer_key'],
    consumer_secret:    SOCIAL_CONFIG['consumer_secret'],
    oauth_token:        SOCIAL_CONFIG['oauth_token'],
    oauth_token_secret: SOCIAL_CONFIG['oauth_token_secret']
  }

  config.lj = {
    user:     SOCIAL_CONFIG['user'],
    password: SOCIAL_CONFIG['password']
  }
  
  config.vk = {
    access_token: SOCIAL_CONFIG['vk']
  }
end