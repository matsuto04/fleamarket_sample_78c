Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' } #sending_destinationテーブルに保存するため
  root 'home#index'
  resources :items
  resources :users 
  resources :cards, only: [:create, :new, :show, :destroy] 
  
end
