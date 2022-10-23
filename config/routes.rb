Rails.application.routes.draw do
  resources :monsters
  resources :tweets
  root "tweets#index"
  resources :locations, only: :create
end
