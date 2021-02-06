Rails.application.routes.draw do
  mount_devise_token_auth_for 'User',
  at: 'auth',
  controllers: { omniauth_callbacks: 'api/omniauth_callbacks'}
  namespace :api do
    resources :posts, only: [:index, :create]
    resources :tracks, only: [:index]
  end
end
