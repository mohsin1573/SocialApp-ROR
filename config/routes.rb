Rails.application.routes.draw do
  resources :posts
  resources :likes, only: [:create, :destroy]
  devise_for :users
  root 'home#index'
  
end
