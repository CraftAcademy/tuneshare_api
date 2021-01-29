RSpec.describe 'GET /api/tracks', type: :request do
  describe 'successfully get a list of songs' do
    subject { response }
    let(:headers) { subject.headers }
    let(:json) { response_json }
    before do
      OmniAuth.config.test_mode = true
      OmniAuth.config.before_callback_phase do |env|
        env['omniauth.origin'] = 'https://example.com/'
      end
      OmniAuth.config.mock_auth[:spotify] = OmniAuth::AuthHash.new(OmniAuthFixtures.spotify_response)
      Rails.application.env_config['devise.mapping'] = Devise.mappings[:user] # If using Devise
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:spotify]
    end
    before do
      get '/api/tracks', params: { q: 'All I Want for Christmas Is You' }
    end

    it 'is expected to return 200 status' do
      expect(response).to have_http_status 200
    end

    it 'is expected to return a list of songs that contain query param' do
      expect(response_json['tracks'].count).to eq 3
    end

    it 'is expected to return an id of the song ' do
      expect(response_json['tracks'][0]['id']).to eq '0bYg9bo50gSsH3LtXe2SQn'
    end

    it 'is expected to return a name of the song ' do
      expect(response_json['tracks'][0]['track']).to eq 'All I Want for Christmas Is You'
    end

    it 'is expected to return an artist name of the song ' do
      expect(response_json['tracks'][0]['artists']).to eq 'Mariah Carey'
    end

    it 'is expected to return an image of the song album' do
      expect(response_json['tracks'][0]['image']).to eq 'https://i.scdn.co/image/ab67616d0000b2734246e3158421f5abb75abc4f'
    end

    it 'is expected to return a preview url of the song' do
      expect(response_json['tracks'][0]['preview']).to eq 'https://p.scdn.co/mp3-preview/bbafd15ff484394a0ca106d5fef0a81eeea4ef5b?cid=774b29d4f13844c495f206cafdad9c86'
    end
  end
end
