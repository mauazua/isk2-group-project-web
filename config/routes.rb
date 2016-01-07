Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  resources :events, only: :index
  root to: "events#index"

  namespace :api do
    resources :events
  end
end
