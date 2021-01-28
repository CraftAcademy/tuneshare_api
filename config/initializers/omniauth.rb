# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify,
           Rails.application.credentials.spotify[:client_id],
           Rails.application.credentials.spotify[:client_secret],
           scope: 'user-read-email user-read-private user-library-read'
end
