Rails.application.routes.draw do

  root to: "home#index"

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'
  get    '/mypage',  to: 'users#show'
  get 'notifications/show'

  # 管理画面
  namespace :admin do
    get    '/'     , to: 'home#index', as: :root
    get    '/login', to: 'sessions#new'
    post   '/login', to: 'sessions#create'
  end

  resources :notifications  
  resources :users

  resources :home

  resources :furnitures do
    get :category_search, on: :collection
    get :scene_search, on: :collection
    get :filter_search, on: :collection
  end

  resources :workshops

end
