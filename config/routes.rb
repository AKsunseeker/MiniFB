Rails.application.routes.draw do
  root 'users#index'

  resources :posts 
  resources :comments
  resources :users
end
