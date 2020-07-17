Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' } #sending_destinationテーブルに保存するため
  root 'home#index'
  resources :items do
    member do
      get :confirm
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    collection do
      get 'search'
      post 'pay/:id'=> 'items#pay', as: 'pay'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'update_done'
    end
  end

  resources :users 
  resources :cards, only: [:create, :new, :show, :destroy] 
end
