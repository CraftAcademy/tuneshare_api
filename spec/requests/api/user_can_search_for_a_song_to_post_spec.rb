RSpec.describe 'GET /api/posts', type: :request do
  describe 'successfully get a list of songs' do
    before do
      get '/api/posts',
          params: {
            query: 'christmas'
          }
    end
    it 'is expected to return a list of songs that contains work christmas' do
      list = RSpotify::Track.find('christmas')
      binding.pry
    end
  end
end
