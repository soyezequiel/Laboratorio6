Rails.application.routes.draw do
  resources :monsters
  resources :tweets
  root "tweets#index"
end
