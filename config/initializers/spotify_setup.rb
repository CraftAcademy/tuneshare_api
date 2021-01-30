client_id = Rails.application.credentials.spotify[:client_id]
client_secret = Rails.application.credentials.spotify[:client_secret]
RSpotify.authenticate(client_id, client_secret)