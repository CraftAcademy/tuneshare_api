# frozen_string_literal: true

RSpec.describe 'GET /omniauth/spotify', type: :request do
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
  describe 'WITH "resource_class" in params' do
    before do
      Rails.application.env_config['omniauth.params'] = { 'resource_class': 'User' }
      get '/auth/spotify/callback'
    end

    it 'is expected to responde with http status 200' do 
      is_expected.to have_http_status 200
    end

    it 'is expected to responde with key user and spotify_info' do
      expect(json)
        .to have_key('user')
        .and have_key('spotify_info')      
    end

    it 'is expected to return user data' do
      expect(json['spotify_info'])
        .to have_key('name')
        .and have_value('Lara Thordardottir')
        .and have_key('email')
        .and have_value('lara@fakemail.com')
    end

    it 'is expected to have valide headers' do
      expect(headers)
        .to have_key('access-token')
        .and have_key('client')
        .and have_key('token-type')
        .and have_key('expiry')
        .and have_key('uid')
        .and have_key('spotify_credentials')      
    end

    it 'is expected to have valide spotify_credential headers' do
      expect(headers['spotify_credentials'])
        .to have_key('token')
        .and have_key('refresh_token')
        .and have_key('expires_at')
        .and have_key('expires') 
    end
  end

  describe 'WITHOUT "resource_class" in params' do
    before do
      Rails.application.env_config['omniauth.params'] = { }
      get '/auth/spotify/callback'
    end

    it 'is expected responde with http status 200' do
      is_expected.to have_http_status 200
    end

    it 'is expected to responde with key user and spotify_info' do
      expect(json)
        .to have_key('user')
        .and have_key('spotify_info')
    end
  end
end
