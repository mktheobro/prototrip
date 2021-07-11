Rails.application.routes.draw do
  devise_for :users
  get 'trips/index'
  root to: "trips#index"
  resources :trips, only: [:index, :create, :new, :show]
end
