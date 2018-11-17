require 'httparty'

class Watson
  API_URL_TOKEN = 'https://iam.bluemix.net/identity/token'
  API_URL_PERSONALITY = 'https://gateway.watsonplatform.net/personality-insights/api/v3/profile'
  API_URL_LASTFM = 'http://ws.audioscrobbler.com/2.0'

  def get_token
  	@response = HTTParty.post(API_URL_TOKEN,
	  headers: {
	  	'Content-Type' => 'application/x-www-form-urlencoded'
	  	},
	  body: {
	  	'grant_type' => 'urn:ibm:params:oauth:grant-type:apikey',
	  	'apikey' => '3cYEmd5iWRBy6mWwWb3VUA4GhN5VODhpo_mIog5PQRfc'
	  	})
  	return @response['token_type'] + ' ' + @response['access_token']
  end

  def get_personality(text)
  	@response = HTTParty.post(API_URL_PERSONALITY,
  	  headers: {
  	  	'Authorization' => get_token,
  	  	'Content-Type' => 'application/json',
        'Accept' => 'application/json'
        },
      query: {
       	'version' => '2017-10-13',
       	'consumption_preferences' => true,
       	'raw_scores' => true
       	},
      body: text.to_json)
  	return @response
  end

  def get_lastfm(tag)
  	@response = HTTParty.get(API_URL_LASTFM,
  	  headers: {
  	  	'Content-Type' => 'application/json',
        'Accept' => 'application/json'
  	  	},
  	  query: {
  	  	'method' => 'tag.getTopAlbums',
  	  	'tag' => tag,
  	  	'api_key' => 'f7ac8641ca5ef7fc3b02b8b8e199a11f',
  	  	'format' => 'json',
  	  	'limit' => 6
  	  	})
  end
end