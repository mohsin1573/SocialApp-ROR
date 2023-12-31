Rails.application.routes.draw do
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  
  resources :likes, only: [:create, :destroy]
  devise_for :users
  get 'videos/search'
  root 'home#index'
  
end
