Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' } #sending_destinationテーブルに保存するため
  root 'home#index'
  resources :items
  resources :users do
    resources :cards
  end
end
