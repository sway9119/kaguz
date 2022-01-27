Rails.application.routes.draw do
  root to: "home#index"

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'
  get    '/mypage',  to: 'users#show'
  resources :users, only: [:edit, :update]

  resources :home do
    get :category_search, on: :collection
    get :scene_search, on: :collection
  end

  resources :furnitures
  resources :workshops

end
