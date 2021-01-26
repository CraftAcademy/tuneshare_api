Rails.application.routes.draw do
  namespace :api do
    resources :posts, only: [:index, :create]
    resources :tracks, only: [:index]
  end
end
