class Api::TracksController < ApplicationController
  def index
    if params[:query] = params['q']
      spotify_tracks = RSpotify::Track.search(params[:q])
      tracks = spotify_tracks.map do |spotify_track|
        format_response(spotify_track)
      end
    end
    render json: { tracks: tracks }
  end

  private

  def format_response(spotify_track)
    {
      name: spotify_track.name,
      artists: spotify_track.artists[0].name,
      image: spotify_track.album.images[0]['url'],
      preview: spotify_track.preview_url

    }
  end
end
