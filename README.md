# TuneShare API

## Description

TuneShare is a mobile application where the user can post their favorite music. We are using the Spotify API to provide music data. For authentication users on this app, we are using OAuth. which means that in order to use the app, you have to have an active Spotify account. while on the app you can browse all posts, create your own, comment on the post or take a look at your profile to see a list of the songs you have posted. in the index you will see the title of the song, the artist, the album cover and you also have the ability to listen to a preview of the song

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

## Gems

We are using Ruby version '2.5.1'
```
gem 'rails', '~> 6.0.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'rack-cors', require: 'rack/cors'
gem 'rspotify'
gem "omniauth", "~> 1.9.1"
gem 'devise_token_auth'
gem 'omniauth-spotify'
gem 'active_model_serializers'
gem 'omniauth-facebook'
gem 'rest-client'
```
for testing
```
gem 'pry-rails'
gem 'pry-byebug'
gem 'rspec-rails'
gem 'shoulda-matchers'
gem 'factory_bot_rails'
gem 'coveralls', require: false
gem 'webmock'
```
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
