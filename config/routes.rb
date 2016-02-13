Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  resources :events do
    resources :bookings, only: [:create, :destroy]
  end


  root to: "events#index"


  namespace :api do
    resources :users
    resources :events
    resources :bookings
  end
end
