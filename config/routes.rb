Rails.application.routes.draw do
 
  devise_for :users
  root 'precipes#index'
  resources :foods
  resources :recipes
  resources :precipes, only: [:index, :show]
  


  # Defines the root path route ("/")

end