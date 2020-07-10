Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' } #sending_destinationテーブルに保存するため
  root 'home#index'
  resources :items do
    member do
      get :confirm
    end
  end
  resources :cards, only: [:create, :new, :show, :destroy] 
  resources :users 
end
