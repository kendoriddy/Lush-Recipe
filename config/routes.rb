Rails.application.routes.draw do
  devise_for :users
  root 'precipes#index'

  resources :foods
  resources :recipes
  


  # Defines the root path route ("/")

end
