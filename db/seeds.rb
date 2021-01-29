# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
User.create(email: 'user1@mail.com', password: 'password', password_confirmation: 'password' )
User.create(email: 'user2@mail.com', password: 'password', password_confirmation: 'password' )
User.create(email: 'user3@mail.com', password: 'password', password_confirmation: 'password' )
User.create(email: 'user4@mail.com', password: 'password', password_confirmation: 'password' )

Post.create(user_id: 1, track: 'All I Want for Christmas Is You', artists: 'Mariah Carey', image: 'https://i.scdn.co/image/ab67616d0000b2734246e3158421f5abb75abc4f', preview: 'https://p.scdn.co/mp3-preview/bbafd15ff484394a0ca106d5fef0a81eeea4ef5b?cid=9165f2ed52ac4632b2c23038c2fbe1d9', description: 'This is the best christmas song ever! All time favorite!')
Post.create(user_id: 1, track: 'Last Christmas', artists: 'Wham!', image: 'https://i.scdn.co/image/ab67616d0000b273f2d2adaa21ad616df6241e7d', preview: 'https://p.scdn.co/mp3-preview/ad0a6b7428ef900b169449b24c335d885dc029d0?cid=9165f2ed52ac4632b2c23038c2fbe1d9', description: "Please don't say you don't know this song! Very classic christmas song.")
Post.create(user_id: 2, track: "It's Beginning to Look a Lot like Christmas", artists: 'Michael Bublé', image: 'https://i.scdn.co/image/ab67616d0000b273119e4094f07a8123b471ac1d', preview: 'https://p.scdn.co/mp3-preview/798a8bc5a7a95ccad75648a63bc50aa755dc2289?cid=9165f2ed52ac4632b2c23038c2fbe1d9', description: 'Everyone can agree on this makes christmas perfect!')
Post.create(user_id: 2, track: "One Beer", artists: 'MF DOOM', image: 'https://i.scdn.co/image/ab67616d0000b27378c9eee96fec41ec24c0ae1c', preview: 'https://p.scdn.co/mp3-preview/4ae054ff5e142a8aef2018c4f83e00d1ac764370?cid=9165f2ed52ac4632b2c23038c2fbe1d9', description: 'I listen to this while Im drinking beer')
Post.create(user_id: 3, track: "Cookie Chips", artists: 'Rejjie Snow', image: 'https://i.scdn.co/image/ab67616d0000b273af865889727087bf5652aae3', preview: 'https://p.scdn.co/mp3-preview/244c7855b611950bd8843e61fd5ef5f41bd919f6?cid=9165f2ed52ac4632b2c23038c2fbe1d9', description: 'I listen to this while Im eating Cookie and Chips')
Post.create(user_id: 4, track: "CELLZ", artists: 'MF DOOM', image: 'https://i.scdn.co/image/ab67616d0000b2731c74e2608e3caae82a1680bd', preview: 'https://p.scdn.co/mp3-preview/3a26b78e35731d64d068ed11d1b456cf47fafe21?cid=9165f2ed52ac4632b2c23038c2fbe1d9', description: 'This song has a one minute and 45 seconds intro!')
