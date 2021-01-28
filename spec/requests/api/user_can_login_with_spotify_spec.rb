# frozen_string_literal: true

RSpec.describe 'GET /auth/spotify', type: :request do

  describe '' do

    before do
      OmniAuth.config.test_mode = true
      # OmniAuth.config.before_callback_phase do |env|
      #   env['omniauth.origin'] = 'https://example.com/'
      # end
      OmniAuth.config.mock_auth[:spotify] = OmniAuth::AuthHash.new(OmniAuthFixtures.spotify_response)
      # Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
      # Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:spotify]

      get '/auth/spotify/callback'
    end
    it 'is expected to...' do
      binding.pry

    end
  end
end