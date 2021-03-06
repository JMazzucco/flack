Rails.application.routes.draw do
  resources :organizations
  root "home#show"
  resources :cards
  resources :lists
  resources :boards
  resources :users
  get "/webhooks/receive", to: "webhooks#complete"
  post "/webhooks/receive", to: "webhooks#receive"
  # resources :webhooks

  get '/auth/:provider/callback', to: 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
