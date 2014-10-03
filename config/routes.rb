Bizusafo::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  namespace :api do
    namespace :v1 do
      resource :token, only: :create
      resources :stories, only: :create
    end
  end

  resources :profiles, only: :show do
    get "/favorites", action: :favorites, as: :favorites
    get "/negatives", action: :negatives, as: :negatives
  end

  resource :notification_setting, only: :update

  resources :stories do
    put :positive
    put :negative
  end

  resources :comments

  root "home#index"
end
