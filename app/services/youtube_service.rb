require 'httparty'

class YoutubeService
  include HTTParty

  base_uri 'https://www.googleapis.com/youtube/v3'

  def initialize(api_key, q)
    @options = { query: { key: api_key, q: q, part: 'snippet', type: 'video' } }
  end

  def search
    self.class.get('/search', @options)
  end
end

api_key = 'AIzaSyDcaPvhuePw19FYI0vb2tSizxNEuo677yw'
search_query = 'gym'  

youtube_service = YoutubeService.new(api_key, search_query)
response = youtube_service.search

puts response.body, response.code, response.message, response.headers.inspect
