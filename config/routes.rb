Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' } #sending_destinationテーブルに保存するため
  # root 'home#index'
  root 'items#show'
  resources :items
  resources :users 
  resources :cards, only: [:create, :new, :show, :destroy] 
  
end
