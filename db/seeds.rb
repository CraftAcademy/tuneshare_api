# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
User.create(email: 'user1@mail.com', password: 'password')
User.create(email: 'user2@mail.com', password: 'password')
User.create(email: 'user3@mail.com', password: 'password')
User.create(email: 'user4@mail.com', password: 'password')

Post.create(user_id: 1, track: 'Rosa helikopter', artists: 'Peaches', image: 'https://i.scdn.co/image/ab67616d0000b273d09ce4eeedc8c1c37323a587', preview: 'https://p.scdn.co/mp3-preview/76dc2316a985b89e1b5dd85334c54c2495caf2f9?cid=9165f2ed52ac4632b2c23038c2fbe1d9', description: 'I would love to fly in a pink helicopter! Anyone want to ride with me?')
Post.create(user_id: 1, track: 'Papaya Whip', artists: 'American Rock Guitar Band', image: 'https://i.scdn.co/image/ab67616d0000b2738d928f59dec6b2bd601e5da3', preview: 'https://p.scdn.co/mp3-preview/75f676ea255a05b3f3714294b367a260a06dc31d?cid=9165f2ed52ac4632b2c23038c2fbe1d9', description: 'I have papayawhip for dessert today, it was so yummy!')
Post.create(user_id: 2, track: 'Mint Cream', artists: 'Cosmic Project', image: 'https://i.scdn.co/image/ab67616d0000b273e378ee7f7e06d11f3ddb113c', preview: 'https://p.scdn.co/mp3-preview/d2d4b665a24d256e590f9b138a70c1215fba4bd9?cid=9165f2ed52ac4632b2c23038c2fbe1d9', description: 'I like whip cream but mint cream is my fave!')
Post.create(user_id: 2, track: 'Lavender Blush', artists: 'Nobuya Kobori', image: 'https://i.scdn.co/image/ab67616d0000b273dc78af9a1e3c82b7f090bbe5', preview: 'https://p.scdn.co/mp3-preview/fad02873e2c9569dbca5c8829afdb4451e066486?cid=9165f2ed52ac4632b2c23038c2fbe1d9', description: 'This song as sweet as my lavender blush on my face!')
Post.create(user_id: 3, track: 'Pink Salmon', artists: 'Peewee Longway', image: 'https://i.scdn.co/image/ab67616d0000b273ce38c038198b8666e03c3987', preview: 'https://p.scdn.co/mp3-preview/ccdb95d288576fc8fafa5ac47302e55806740b9f?cid=9165f2ed52ac4632b2c23038c2fbe1d9', description: 'I listen to this while Im eating my pink salmon. So tasty!')
Post.create(user_id: 4, track: 'Peachpuff', artists: 'Jellymastermen', image: 'https://i.scdn.co/image/ab67616d0000b27331871632e947d529e0f19bdc', preview: 'https://p.scdn.co/mp3-preview/c76c3bae766a2f4e904b59d95b2c946172c0cfa9?cid=9165f2ed52ac4632b2c23038c2fbe1d9', description: 'Peach is one of my favorite fruits, even better when its a puff!')
Post.create(user_id: 4, track: 'Aliceblue', artists: 'Karl J. Anderson', image: 'https://i.scdn.co/image/ab67616d0000b2739e9d728243e3b8752da1df8e', preview: 'https://p.scdn.co/mp3-preview/aee0d9d2203158226d012fff8e56ad86591a165c?cid=9165f2ed52ac4632b2c23038c2fbe1d9', description: 'I listen to this song when I feel blue(My name is Alice)')

Comment.create(user_id: 4, post_id: 1, content: 'Wow what a lovely song. This song reminds me of good old days!')
Comment.create(user_id: 1, post_id: 1, content: 'I know! All the Swedish love this song!')
Comment.create(user_id: 3, post_id: 2, content: 'Papaya Whip! What a lovely name! I only knew papaya whip color, but now I love this song too.')
Comment.create(user_id: 2, post_id: 2, content: 'Papaya is sweet.')
