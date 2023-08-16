class VideosController < ApplicationController
    def search
        api_key = 'AIzaSyDcaPvhuePw19FYI0vb2tSizxNEuo677yw'
        search_query = params[:query]

        youtube_service = YoutubeService.new(api_key, search_query)
        @response = youtube_service.search
    end
end
