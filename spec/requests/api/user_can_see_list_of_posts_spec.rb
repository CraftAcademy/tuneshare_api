RSpec.describe 'GET /api/posts', type: :request do
  let(:user) {create(:user)}
  let!(:post) { 3.times { user {create(:post)} } }
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
  describe 'successfully get a list of posts' do
    before do 
      get '/api/posts'
    end 

    it 'is expected to return a 200 response' do
      expect(response).to have_http_status 200
    end

    it 'is expected to return all posts' do
      expect(response_json['posts'].count).to eq 3
    end

    it 'is expected to have a track name in the first post' do
      expect(response_json['posts'][0]['track']).to eq 'MyTrack'
    end

    it 'is expected to have an artist in the second post' do
      expect(response_json['posts'][1]['artists']).to eq 'MyArtist'
    end

    it 'is expected to have an image in the third post' do
      expect(response_json['posts'][2]['image']).to eq 'MyImage'
    end
  end
end
