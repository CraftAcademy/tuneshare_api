FactoryBot.define do
  factory :post do
    track { "MyTrack" }
    artists { "MyArtist" }
    image { "MyImage" }
    preview { "MyPreview" }
    description { "MyDescription" }
    factory :user_with_posts do
      posts { [association(:post)] }
    end
  end
end

# FactoryBot.modify do
#   factory :post do
#     track { "MyTrack" }
#     artists { "MyArtist" }
#     image { "MyImage" }
#     preview { "MyPreview" }
#     description { "MyDescription" }
#     association :user
#   end
# end