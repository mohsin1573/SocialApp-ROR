Rails.application.routes.draw do
  resources :posts do
    resources :comments, only: [:create]
  end
  
  resources :likes, only: [:create, :destroy]
  devise_for :users
  root 'home#index'
  
end
