# frozen_string_literal: true

module OmniAuthFixtures
  def self.spotify_response
    { 'provider' => 'spotify',
      'uid' => '11133470713',
      'info' =>
      { 'name' => 'Lara Thordardottir',
        'nickname' => '11133470713',
        'email' => 'lara-thordar@hotmail.com',
        'urls' => { 'spotify' => 'https://open.spotify.com/user/11133470713' },
        'image' =>
        'https://scontent.xx.fbcdn.net/v/t1.0-1/p200x200/18920696_10154468874267665_3311690800281955732_n.jpg?oh=480b96eafd1897d08fd6b582a21de6a2&oe=5B0A2CB8',
        'birthdate' => nil,
        'country_code' => 'GB',
        'product' => 'premium',
        'follower_count' => 13 },
      'credentials' =>
      { 'token' =>
        'BQApsLYWLSCbQVu5ehkEW9H90XPFSt0VqQ3LZSDV99SsrUAY3P8we83o41AQGnna1KcBG6Dfq5-LQGtzNHaBMz_UU-OuG-eYqzKNfnSGcJIVF-jsNKS3gHt6x6daGMqfzkBvLNgmCSTtIbNC-liB_tHTGlDagSHRqWpJqy7ZGSeerA',
        'refresh_token' =>
        'AQAmcIiqa0ZJm6EKINuVl1uLJmVBoilvi7UmxYfZOwSiEGZ99KOXCY5GHkvIGv-e-CW0Oo9LCkNNC4j9u3pKHHKxAPcyIKmrJVRjNUQc4mk9euXTAYQvGDHCM03qDTZD3VY',
        'expires_at' => 1_520_072_214,
        'expires' => true },
      'extra' =>
      { 'raw_info' =>
        { 'country' => 'GB',
          'display_name' => 'Lara Thordardottir',
          'email' => 'lara-thordar@hotmail.com',
          'external_urls' => { 'spotify' => 'https://open.spotify.com/user/11133470713' },
          'followers' => { 'href' => nil, 'total' => 13 },
          'href' => 'https://api.spotify.com/v1/users/11133470713',
          'id' => '11133470713',
          'images' =>
          [{ 'height' => nil,
             'url' =>
             'https://scontent.xx.fbcdn.net/v/t1.0-1/p200x200/18920696_10154468874267665_3311690800281955732_n.jpg?oh=480b96eafd1897d08fd6b582a21de6a2&oe=5B0A2CB8',
             'width' => nil }],
          'product' => 'premium',
          'type' => 'user',
          'uri' => 'spotify:user:11133470713' } } }
  end
end
