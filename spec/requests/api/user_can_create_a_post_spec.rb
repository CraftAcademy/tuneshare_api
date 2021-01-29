RSpec.describe 'POST /api/posts', type: :request do
  describe 'successfully create a post' do
    subject { response }
    let(:headers) { subject.headers }
    let(:json) { response_json }
    before do
      post '/api/posts',
           params: {
             post: {
               track: 'One Beer',
               artists: 'MF DOOM',
               image: 'https://i.scdn.co/image/ab67616d0000b27378c9eee96fec41ec24c0ae1c',
               preview: 'https://p.scdn.co/mp3-preview/4ae054ff5e142a8aef2018c4f83e00d1ac764370?cid=9165f2ed52ac4632b2c23038c2fbe1d9',
               description: 'I listen to this when Im drinking beer'
             }
           }
           OmniAuth.config.test_mode = true
           OmniAuth.config.before_callback_phase do |env|
             env['omniauth.origin'] = 'https://example.com/'
           end
           OmniAuth.config.mock_auth[:spotify] = OmniAuth::AuthHash.new(OmniAuthFixtures.spotify_response)
           Rails.application.env_config['devise.mapping'] = Devise.mappings[:user] # If using Devise
           Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:spotify]
     
    end

    it 'is expected to return a 201 status' do
      expect(response).to have_http_status 201
    end

    it 'is expected to return a success message' do
      expect(response_json['message']).to eq 'Your post was successfully created!'
    end
  end
  describe 'unsuccessfully create a post' do
    before do
      post '/api/posts',
           params: {
             post: {
               artists: 'MF DOOM',
               image: 'https://i.scdn.co/image/ab67616d0000b27378c9eee96fec41ec24c0ae1c',
               preview: 'https://p.scdn.co/mp3-preview/4ae054ff5e142a8aef2018c4f83e00d1ac764370?cid=9165f2ed52ac4632b2c23038c2fbe1d9',
               description: 'I listen to this when Im drinking beer'
             }
           }
    end

    it 'is expected to return a 422 status' do
      expect(response).to have_http_status 422
    end

    it 'is expected to return a error message when track name missing' do
      expect(response_json['message']).to eq "Track can't be blank and User must exist"
    end
  end
end
