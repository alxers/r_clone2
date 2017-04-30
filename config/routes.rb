Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :tokens, only: [:create]
      jsonapi_resources :users
      jsonapi_resources :reddits
      jsonapi_resources :posts
      jsonapi_resources :comments
    end
  end
end
