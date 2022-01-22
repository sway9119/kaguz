Rails.application.routes.draw do
  root to: "home#index"

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :home do
    get :category_search, on: :collection
    get :scene_search, on: :collection
  end

  resources :furnitures

end
