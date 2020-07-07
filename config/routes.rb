Rails.application.routes.draw do
  devise_for :users
  # root 'home#index'
  root 'items#show'
  resources :items
  resources :users
end
