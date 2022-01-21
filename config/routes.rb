Rails.application.routes.draw do

  root to: "home#index"

  resources :home do
    get :category_search, on: :collection
    get :scene_search, on: :collection
  end

  resources :furnitures

end
