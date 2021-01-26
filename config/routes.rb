Rails.application.routes.draw do
  namespace :api do
    resources :posts, only: [:index]
    resources :tracks, only: [:index]
  end
end
