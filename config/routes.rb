Rails.application.routes.draw do
  devise_for :users
  root 'spots#index'
  resources :spots
  resources :users, only: [:show, :edit, :update]
  resources :spots do 
    resources :comments, only: [:create]
  end 
end
