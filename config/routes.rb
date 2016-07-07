Rails.application.routes.draw do
  root "boards#new"
  resources :cards
  resources :lists
  resources :boards
  resources :users
  resources :webhooks
  post "/webhooks/receive", to: "webhooks#receive"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
