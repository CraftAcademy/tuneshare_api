FactoryBot.define do
  factory :post do
    track { "MyTrack" }
    artists { "MyArtist" }
    image { "MyImage" }
    preview { "MyPreview" }
    description { "MyDescription" }
    association :user
  end
end
