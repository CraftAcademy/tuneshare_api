Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', 
  at: 'auth', 
  controllers: { omniauth_callbacks: 'api/omniauth_callbacks' }
  
  namespace :api do
    resources :posts, only: %i[index create] do
      resources :comments, only: [:create, :index]
      resources :likes, only: [:create]
    end
    resources :tracks, only: [:index]
    get 'omniauth_callbacks/spotify'
  end
end
