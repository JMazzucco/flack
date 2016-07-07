Rails.application.routes.draw do
  resources :cards
  resources :lists
  resources :boards
  resources :users
  resources :webhooks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
