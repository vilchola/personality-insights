class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  def twitter_client
  	Twitter::REST::Client.new do |config|
  	  config.consumer_key = 'W4jxpHjsuLsOmw8J4DusLRpjv'
  	  config.consumer_secret = 'NzTM118AhgTD8EyDjUa6tZqQHo3eCtVLSqNhTW55x0rAqme2em'
  	  config.access_token = '224658231-hi0RUJyYhvrBJW258dCVfO9MsRgmpg4ncAdZ3Cbs'
  	  config.access_token_secret = 'rThDURkb3bc8mKG4CDMGdXmq5KCM6qXfkXmVKd76F9UqW'
  	 end
  end
end
