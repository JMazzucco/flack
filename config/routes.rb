Rails.application.routes.draw do
  root "home#show"
  resources :cards
  resources :lists
  resources :boards
  resources :users
  post "/webhooks/receive", to: "webhooks#receive"
  resources :webhooks

  get '/auth/:provider/callback', to: 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
