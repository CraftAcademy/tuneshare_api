FactoryBot.define do
  factory :post do
    track_name { "MyTrack" }
    artists { "MyArtist" }
    image { "MyImage" }
    preview_url { "MyPreview" }
    description { "MyDescription" }
  end
end
