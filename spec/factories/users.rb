FactoryBot.define do
  factory :user do
    email { "user@random.com" }
    password { "password" }
    password_confirmation { "password" }
    # factory :user_with_posts do
    #   posts { [association(:post)] }
    # end
  end
end