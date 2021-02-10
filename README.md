# TuneShare API

## Description

This is a mobile application where the user can post their favorite music. We are using the Spotify API to provide music data. To authenticate users on this app, we are using OAuth. Which means that in order to use the app, you have to have an active Spotify account. While on the app you can browse all posts, create your own, comment or like on the post or take a look at your profile to see a list of the songs you have previously posted. In the Post index you will see the title of the song, the artist, the album cover and you also have the ability to listen to a preview of the song for 30 seconds.

## The code

### Installation

1. Fork and clone [Tune Share API](https://github.com/CraftAcademy/tuneshare_api) to your local workspace.

2. Install the project dependencies.

```
bundle
```

3. Create, migrate and seed(optional) your database.

```
rails db:create db:migrate db:seed
```

4. start the server
(the application is deployed on Heroku, so this is also optional)

```
rails s
```


### The User Interface can be found here:

- [Tune Share Client](https://github.com/CraftAcademy/tuneshare_client)

## Dependencies

We are using Ruby version '2.5.1'

* Rails
* Pg 
* Puma
* Bootsnap
* Rack-cors
* RSpotify
* Omniauth
* Devise_token_auth
* Omniauth-spotify
* Active_model_serializers
* Omniauth-facebook
* Rest-client

For testing

* Pry-rails
* Pry-byebug
* RSpec-rails
* Shoulda-matchers
* Factory_bot_rails
* Coveralls
* Webmock

## Acknowledgements

- [Craft Academy](https://www.craftacademy.se/) coaches: [Thomas Ochman](https://github.com/tochman) and [Emma-Maria Thalen](https://github.com/emtalen)

## License

MIT License

## Authors

- [Sanne Lindholm](https://github.com/salindholm)
- [Kyungin Na](https://github.com/KyunginNa)
- [Viktor Karlsson](https://github.com/ViktorHek)
- [William Höök-Specker](https://github.com/sealfury)
- [Rithreaksa Khourn](https://github.com/rithreaksa)
